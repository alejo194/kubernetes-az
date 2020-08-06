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
##### 3. gcePersistentDisk

##### 4. awsElasticBlockStore

##### 5. NFS
```bash
volumes:
- name: nfs
  nfs:
    # 改为你的NFS服务器地址
    server:nfs-server.localhost
    path: "/"
```
##### 6. 其他类型的Volume
+ iscsi
+ flocker
+ glusterfs 使用开源GlusterFS网络文件系统的目录挂载到Pod中
+ rbd
+ gitRepo 通过挂载一个空目录，并从Git库clone一个get repository以提供Pod使用
+ secret
