#### VIP和Service代理
```bash
  在Kubernetes集群中，每个Node运行一个kube-proxy进程，kube-prox负责为Service实现了一种VIP（虚拟IP）的形式，而不是ExternalName的形式。
在Kubernetes v1.0版本，代理完全在userspace。在Kubernetes v1.1版本。新增了iptables 代理，但并不是默认的运行模式。从Kubernetes v1.2起，默认就是iptables代理。在Kubernetes v1.8-beta.0中，添加了ipvs代理
kubernetes 1.14版本开始默认使用ipvs代理
在Kubernetes v1.0版本，Service是“4层”（TCP/UDP over IP）概念。在Kubernetes v1.1版本，新增Ingress API(beta版)，用来表示“7层”（HTTP）服务
```
