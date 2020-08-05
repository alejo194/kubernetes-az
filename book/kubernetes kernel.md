####  1. Master 集群的控制节点
+ ***Kubernetes API Server***
> Kubernetes API Server最主要的REST接口是资源对象的增、删、改、查，除此之外它还提供了一种特殊的REST接口--Kubernetes Proxy API接口，
> 这类接口的作用是代理REST请求,即Kubernetes API Server把收到的REST请求转发到某个Node上的kubelet守护进程的REST端口上，由该Kebulet进程负责响应。</br>
> 1.常见的交互场景一是kubectl进程与API Server的交互；<br/>
> 每个Node节点上的kubelet每隔一个时间周期，就会调用一次API Server的REST接口报告自身状态，API Server接收到这些信息后，将节点的状态信息更新到etcd中。</br>
> kubectl也通过API Server的Watch接口监听Pod信息,对其进行增、删、改。</br>
> 2.常见的交互场景二是kube-controller-manager进程与API Server的交互。</br>
> kube-controller-manager中的Node Controller模块通过API Server提供的Watch接口，实时监控Node的信息，并做相应处理。</br>
> 3.还有一个重要的场景交互式kube-scheduler与API Server的交互。</br>
> 当Scheduler通过API Server的Watch接口监听到新建Pod副本的信息后，他会检索所有符合该Pod要求的Node列表，开始执行Pod调度逻辑，调度成功后将Pod绑定到
> 目标节点上。

+ ***Controller Manager***
> K8s里所有资源对象的自动化控制中心，可以理解为资源对象的“大总管”。
+ ***Scheduler***
> 负责资源调度（Pod调度）的进程，相当于公交公司的“调度室”。
Master节点上还启动了一个etcd Server进程，因为K8s里的所有资源对象的数据全部保存在etcd中的。

#### 2. Node 除了master,其他都是
```bash
Node上运行着kubernetes的kubelet,kube-proxy服务进程，这些服务进程负责Pod的创建、启动、监控、重启、销毁，以及实现软件模式的负载均衡器
```
+ ***kubelet***
> 负责Pod对应的容器的创建、启停等任务，同时与Master节点密切协作，实现集群管理的基本功能。
+ ***kube-proxy***
> 实现K8s Service的通信与负载均衡机制的重要组件。
+ ***Docker Engine***
> Docker 引擎，负责本机的容器创建和管理工作。
