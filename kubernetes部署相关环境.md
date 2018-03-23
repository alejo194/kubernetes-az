## 安装部署环境：
1. 三台debian8 64位 ，2核cpu, memory 10G 
```bash
192.168.40.171  Master(etcd) 
192.168.40.172  Node(etcd, docker, flannel) 
192.168.40.173  Node(etcd, docker, flannel) 
```
kubernetes v1.6.2 (kube-apiserver, kube-controller-manager, kube-scheduler, kubelet, kube-proxy, kubectl) <br/>
etcd version: 3.3.0-rc.3 (etcd服务作为Kubernetes集群的主资料库，在安装Kubernetes各服务之前需要首先安装和启动) <br/>
flannel version: v0.7.1 (采用覆盖式网络Overlay Network模型来完成对网络的打通) <br/>
docker version: 1.12.6 <br/>

## 注意：
1. Master 和 Node之间有大量的网络通信，在一个安全的内部网络环境中可以关闭防火墙服务：
```bash
$ systemctl disable firewalld
$ systemctl stop firewalld
```
将Kubernetes的可执行文件复制到/usr/bin(如果要复制到其他目录，则将systemd服务文件中的文件路径修改正确即可)

2. 在Debian8 上 cgroup memory swapaccount 默认没有enable:
会出现如 <br/>
kube-controller-manager开启报错<br/>
[plain]  E0221 18:12:14.791503   16229 kubelet.go:1228] Failed to start ContainerManager system validation failed - Following Cgroup subsystem not mounted: [memory]  <br/>
ContainerManager system 无法启动从而造成容器无法被启动 <br/>
解决方法：
```bash
vi /etc/default/grup中添加下面一行
GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1" 
更新grub并重启可以解决
$ sudo update-grub
$ sudo reboot
```
3. 三台机器etcd下载：
https://github.com/coreos/etcd/releases/
将etcd和etcdctl文件复制到/usr/bin目录（官网复制/usr/local/bin）
```bash
$ etcdctl cluster-health (验证etcd是否正确开启)
```
