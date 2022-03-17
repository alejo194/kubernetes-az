#### VIP和Service代理
```bash
  在Kubernetes集群中，每个Node运行一个kube-proxy进程，kube-prox负责为Service实现了一种VIP（虚拟IP）的形式，而不是ExternalName的形式。
在Kubernetes v1.0版本，代理完全在userspace。在Kubernetes v1.1版本。新增了iptables 代理，但并不是默认的运行模式。
```
