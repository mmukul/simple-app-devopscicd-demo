
### Gather Facts

```sh
ansible <TARGET_NODE> -m setup
```

## Transfer file
```sh
ansible <TARGET_NODE> -m copy -a "src=/path/file dest=/path"
```

### Create new directory

```sh
ansible <TARGET_NODE> -m file -a "dest=/path/dir mode=644 state=directory"
```

### Delete a file

```sh
ansible <TARGET_NODE> -m file -a "dest=/path/file state=absent"
```

### Install Package

```sh
ansible <TARGET_NODE> -m yum -a "name=git state=present"
```

### Remove Package

```sh
ansible <TARGET_NODE> -m yum -a "name=git state=absent"
```
