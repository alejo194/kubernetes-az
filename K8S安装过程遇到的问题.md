1、在Debian8 上 cgroup memory swapaccount 默认没有enable
会出现如
[plain]  E0221 18:12:14.791503   16229 kubelet.go:1228] Failed to start ContainerManager system validation failed - Following Cgroup subsystem not mounted: [memory]  
ContainerManager system 无法启动从而造成容器无法被启动

解决方法：
vi /etc/default/grub中添加下面一行
GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1" 
更新grub并重启可以解决
$ sudo update-grub
$ sudo reboot


2、$ docker info
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
