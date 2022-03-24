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
postPath 卷将主机节点的文件系统中的文件或目录挂载到集群中
postPath 的用途如下：
+ 运行需要访问Docker内部的容器；使用/var/lib/docker的hostPath
+ 在容器中运行cAdvisor; 使用/dev/cgroups的hostPath

> 除了所需的path属性之外，用户还可以为hostPath卷指定type
