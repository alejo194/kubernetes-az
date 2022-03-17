#### VIP和Service代理
```bash
  在Kubernetes集群中，每个Node运行一个kube-proxy进程，kube-prox负责为Service实现了一种VIP（虚拟IP）的形式，而不是ExternalName的形式。
在Kubernetes v1.0版本，代理完全在userspace。在Kubernetes v1.1版本。新增了iptables 代理，但并不是默认的运行模式。从Kubernetes v1.2起，默认就是iptables代理。在Kubernetes v1.8-beta.0中，添加了ipvs代理
kubernetes 1.14版本开始默认使用ipvs代理
在Kubernetes v1.0版本，Service是“4层”（TCP/UDP over IP）概念。在Kubernetes v1.1版本，新增Ingress API(beta版)，用来表示“7层”（HTTP）服务
```
##### ClusterIP
```bash
  clusterIP主要在每个node节点使用iptales,将发向clusterIP对应端口的数据，转发到kube-proxy中。然后kube-proxy自己内部实现有负载均衡的方法，并可以查询到这个service下对应pod的地址和端口，进而把数据转发给对应的Pod的地址和端口
```
#### Headless Service
```bash
  有时不需要或不想要负载均衡，以及单独的Service IP.遇到这种情况，可以通过指定Cluster IP(spec.clusterIP)的值为“None”来创建Headless Service. 这类Service并不会分配Cluster IP, kube-proxy不会处理它们，而且平台也不会为它们进行负载均衡和路由
```
