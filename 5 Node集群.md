### 1.检查环境
请先确保前面的环境正常, 再进行这一步, 否则出现的各种错误很难定位</br>
#### 检查证书环境
![检查证书环境](./images/kubernetes-ssl.png)
#### 检查kubelet和kube-proxy环境
![检查kubelet和kube-proxy环境](./images/node-kube.png)
#### 检查kubectl工具类环境
![kubectl环境](./images/node-kubectl.png)

### 2.k8s运行环境
#### 将master可执行文件目录远程复制过来
```bash
下载kubernetes server 所在目录
scp -rp /root/kubernetes/server/bin/{kubectl,kubelet,kube-proxy} root@192.168.40.172:/usr/local/bin/
这里kubectl copy到各机器方便查询
```
> Node只需要启动2个服务, 分别为kubelet, kube-proxy(master可以是node)

### 3.安装配置Docker和Flannel
> Docker 安装参考官网 Docker version 1.12.6 
#### Flannel安装
```bash
$ mkdir flannel
$ wget https://github.com/coreos/flannel/releases/download/v0.7.1/flannel-v0.7.1-linux-amd64.tar.gz
$ tar -xzvf flannel-v0.7.1-linux-amd64.tar.gz -C flannel
$ sudo cp flannel/{flanneld,mk-docker-opts.sh} /usr/local/bin
```
#### 创建 flanneld 的 systemd unit 文件
```bash
vi /etc/systemd/system/flanneld.service

[Unit]
Description=Flanneld overlay address etcd agent
After=network.target
After=network-online.target
Wants=network-online.target
After=etcd.service
Before=docker.service

[Service]
Type=notify
ExecStart=/usr/local/bin/flanneld \
  -etcd-endpoints=http://192.168.40.171:2379,http://192.168.40.172:2379,http://192.168.40.173:2379 \
  -etcd-prefix=/kubernetes/network
ExecStartPost=/usr/local/bin/mk-docker-opts.sh -k DOCKER_NETWORK_OPTIONS -d /run/flannel/docker
Restart=on-failure

[Install]
WantedBy=multi-user.target
RequiredBy=docker.service
```


### 4.安装和配置kubelet

### 5.安装和配置kube-proxy

### 6.验证

