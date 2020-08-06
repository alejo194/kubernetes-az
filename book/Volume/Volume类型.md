#### Volume 类型
##### 1. emptyDir

##### 2. hostPath
```bash
例：使用宿主机的/data目录定义一个hostPath类型的Volume
volumes:
- name: "persistent-storage"
  hostPath:
    path: "/data"
```
