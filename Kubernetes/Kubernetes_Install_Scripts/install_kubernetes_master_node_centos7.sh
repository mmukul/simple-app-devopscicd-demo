#!/bin/bash

swapoff -a
sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

setenforce 0
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
reboot

modprobe br_netfilter
echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables

cat <<EOF | tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

modprobe overlay && \
modprobe br_netfilter


cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/repodata/repomd.xml.key
exclude=kubelet kubeadm kubectl cri-tools kubernetes-cni
EOF

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

yum install -y yum-utils docker kubelet kubeadm kubectl --disableexcludes=kubernetes

yum install containerd.io -y

CONTAINDERD_CONFIG_PATH=/etc/containerd/config.toml && rm "${CONTAINDERD_CONFIG_PATH}" && \
containerd config default > "${CONTAINDERD_CONFIG_PATH}" && \
sed -i "s/SystemdCgroup = false/SystemdCgroup = true/g"  "${CONTAINDERD_CONFIG_PATH}"


# Enable and start kubelet service
systemctl enable --now containerd && systemctl restart containerd
systemctl enable kubelet && systemctl start kubelet && systemctl enable docker && systemctl start docker

# Initialize the control plane in the master node as the root user
kubeadm init

# exit root as normal user
exit
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# verify if kubectl is working or not, run the following command.
kubectl get pod -A

# Run the following command to deploy the network plugin (calico network)
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.28.0/manifests/tigera-operator.yaml
curl https://raw.githubusercontent.com/projectcalico/calico/v3.28.0/manifests/custom-resources.yaml -O
kubectl create -f custom-resources.yaml
watch kubectl get pods -n calico-system

# verify if weave is deployed successfully
kubectl get pods -A


kubectl describe node kube-master | grep Taints
kubectl taint nodes --all node-role.kubernetes.io/control-plane:NoSchedule-