#### volume PV PVC
##### emptyDir用法
+ 缓存空间，例如用于基于磁盘的合并排序
+ 用作长时间计算崩溃恢复时的检查点
+ web服务器容器提供数据时，保存内容管理器提取的文件
```bash
apiVersion: v1
kind: Pod
metadata:
  name: test-pd
spec:
  containers:
  - image: k8s.gcr.io/test-webserver
    name: test-container
    volumeMounts:
    - mountPath: /cache
      name: cache-volume
  volumes:
  - name: cache-volume
    emptyDir: {}
```
#### hostPath
postPath 卷将主机节点的文件系统中的文件或目录挂载到集群中 /br
postPath 的用途如下： /br
+ 运行需要访问Docker内部的容器；使用/var/lib/docker的hostPath
+ 在容器中运行cAdvisor; 使用/dev/cgroups的hostPath

> 除了所需的path属性之外，用户还可以为hostPath卷指定type
使用这种卷类型时请注意，因为：
+ 由于每个节点上的文件都不同，具有相同配置（例如从podTemplate创建）的pod在不同节点上的行为可能会有所不同
+ 当Kubernetes按照计划添加资源感知调度时，将无法考虑postPath使用的资源
+ 在底层主机上创建的文件或目录只能有root写入。你需要在权限容器中以root身份运行进程，或修改主机上的文件权限以便写入hostPath卷
```bash
apiVersion: v1
kind: Pod
metadata:
  name: test-pd
spec:
  containers:
  - image: nginx
    name: test-container
    volumeMounts:
    - mountPath: /test-pd
      name: test-volume
   volumes:
   - name: test-volume
     hostPath:
       path: /data
       type: Directory
```
