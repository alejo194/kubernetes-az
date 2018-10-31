#### 1、在Debian8 上 cgroup memory swapaccount 默认没有enable
```bash
会出现如
[plain]  E0221 18:12:14.791503   16229 kubelet.go:1228] Failed to start ContainerManager system validation failed - Following Cgroup subsystem not mounted: [memory]  
ContainerManager system 无法启动从而造成容器无法被启动

解决方法：
vi /etc/default/grub中添加下面一行
GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1" 
更新grub并重启可以解决
$ sudo update-grub
$ sudo reboot
```


#### 2、Kubelet启动时Failed  skipping pod synchronization - [Failed to start ContainerManager systemd version does not support ability to start a slice as transient unit]
```bash
$ docker info
Containers: 0
 Running: 0
 Paused: 0
 Stopped: 0
Images: 80
Server Version: 1.12.6
Storage Driver: aufs
 Root Dir: /var/lib/docker/aufs
 Backing Filesystem: extfs
 Dirs: 225
 Dirperm1 Supported: true
Logging Driver: json-file
Cgroup Driver: systemd
Plugins:
 Volume: local
 Network: bridge host null overlay
Swarm: inactive
Runtimes: runc
Default Runtime: runc
Security Options:
Kernel Version: 3.16.0-4-amd64
Operating System: Debian GNU/Linux 8 (jessie)
OSType: linux
Architecture: x86_64
CPUs: 2
Total Memory: 7.818 GiB
Name: deb8-171
ID: BWOH:MBUY:UPEO:4S4O:XFEL:ZRCX:AVKQ:Z7JN:WQDG:OI7U:Y7QO:SSHI
Docker Root Dir: /var/lib/docker
Debug Mode (client): false
Debug Mode (server): false
Username: cxhjet
Registry: https://index.docker.io/v1/
WARNING: No kernel memory limit support
WARNING: No cpu cfs quota support
WARNING: No cpu cfs period support
Insecure Registries:
 127.0.0.0/8
 ```
 + 这里docker Cgroup Driver: systemd
 
 ##### 开启kubelet报错
 ![kubelet报错](./images/kubelet-error.png)
 ```bash
kubectl get no
NAME             STATUS     AGE       VERSION
192.168.40.171   NotReady   39m       v1.6.2
192.168.40.172   Ready      56d       v1.6.2
192.168.40.173   Ready      55d       v1.6.2
```
 
 ##### 网上查找相关只有如下
 [原网页地址](https://github.com/gyliu513/kubernetes-handbook-1/blob/master/FAQ.md)
 3.Kubelet启动时Failed to start ContainerManager systemd version does not support ability to start a slice as transient unit
CentOS系统版本7.2.1511</br>
kubelet启动时报错systemd版本不支持start a slice as transient unit。</br>
尝试升级CentOS版本到7.3，看看是否可以修复该问题。</br>
与[kubeadm init waiting for the control plane to become ready on CentOS 7.2 with kubeadm 1.6.1](https://github.com/kubernetes/kubeadm/issues/228) #228类似。</br>

另外有一个使用systemd管理kubelet的proposal。</br>

> 但不知如何解决问题


#### 另一种解决方式
##### 修改 docker Cgroup Driver: cgroupfs
```bash
vi /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=cgroupfs"]
}
没有这个daemon.json文件 docker默认 Cgroup Driver: cgroupfs
```
##### 重启docker
```bash
systemctl daemon-reload
systemctl restart docker.service
```
##### 修改kubelet config 参数
```bash
vi /etc/kubernetes/kubelet-d
--cgroup-driver=cgroupfs
```
##### 重启kubelet
```bash
systemctl daemon-reload
systemctl restart kubelet.service
```
##### 检查
```bash
kubectl get no
NAME             STATUS    AGE       VERSION
192.168.40.171   Ready     1h        v1.6.2
192.168.40.172   Ready     56d       v1.6.2
192.168.40.173   Ready     56d       v1.6.2
```
##### ServiceAccount
```bash
1. ServiceAccount与Secret
先讲讲kubernetes的serviceaccount，我们的服务有时候需要一些带有隐私信息的东西，token，certification file等等，这些东西我们可以在master上创建，然后在创建pod的时候导入进去。具体可以去看github上的secret.md，那里有具体的例子。

我们执行：

kubectl get serviceaccount
如果如下：

NAME      SECRETS
default   1
那么是正常的（用脚本启动的kubernetes一般会是这样的情况） 而如果是：

NAME      SECRETS
default   0
这就麻烦了，用脚本启动k8s，启动的时候是会自动创建一个serviceaccount的，而serviceaccount创建出来的时候又会自动创建一个secret作为这个serviceaccount的token。

我们在apiserver的启动参数中添加：

--admission_control=ServiceAccount
apiserver在启动的时候会自己创建一个key和crt（见/var/run/kubernetes/apiserver.crt和apiserver.key）

然后在启动./kube-controller-manager 时添加flag：

--service_account_private_key_file=/var/run/kubernetes/apiserver.key
这样启动k8smaster后，我们就会发现

kubectl get serviceaccount
结果如下：

NAME      SECRETS
default   1
注意，这里可能会启动apiserver失败，或者启动后没有效果，因为没有secrets的serviceaccount会保存在etcd中，所以我们在正常启动前最好删掉etcd中的旧数据（$etcdctl rm --recursive registry）。
```

