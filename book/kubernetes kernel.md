+ ***Kubernetes API Server***
> Kubernetes API Server最主要的REST接口是资源对象的增、删、改、查，除此之外它还提供了一种特殊的REST接口--Kubernetes Proxy API接口，
> 这类接口的作用是代理REST请求,即Kubernetes API Server把收到的REST请求转发到某个Node上的kubelet守护进程的REST端口上，由该Kebulet进程负责响应。
