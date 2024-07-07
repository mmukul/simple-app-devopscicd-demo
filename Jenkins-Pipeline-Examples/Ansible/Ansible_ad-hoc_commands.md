## Transferring file to many servers

### Gathering Facts

```sh
ansible <TARGET_NODE> -m setup
```

```sh
ansible <TARGET_NODE> -m copy -a "src = /etc/yum.conf dest = /tmp/yum.conf"
```

### Creating new directory

```sh
ansible <TARGET_NODE> -m file -a "dest = /path/user1/new mode = 777 owner = user1 group = user1 state = directory"
```

### Deleting whole directory and files

```sh
ansible <TARGET_NODE> -m file -a "dest = /path/user1/new state = absent"
```

### Install Package

```sh
ansible <TARGET_NODE> -m yum -a "name = git state = present"
```

### Remove Package

```sh
ansible <TARGET_NODE> -m yum -a "name = git state = absent"
```