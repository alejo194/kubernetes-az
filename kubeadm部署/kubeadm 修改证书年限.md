https://blog.51cto.com/legehappy/4895615
##### 下载kubernetes及重新编译
###### 重新编译源码
```bash
* 软件包准备
CentOS：

yum install gcc make -y
yum install rsync jq -y

Ubuntu：

sudo apt install build-essential 
sudo apt install rsync jq -y

* 安装golang
# cat ./build/build-image/cross/VERSION
v1.13.8-1` 

wget https://dl.google.com/go/go1.18.1.linux-amd64.tar.gz
tar zxvf go1.18.1.linux-amd64.tar.gz  -C /usr/local

# vim /etc/profile
export GOROOT=/usr/local/go
export GOPATH=/usr/local/gopath
export PATH=$PATH:$GOROOT/bin

# source /etc/profile



* 重新编译kubeadm
make all WHAT=cmd/kubeadm GOFLAGS=-v

# 编译kubelet
# make all WHAT=cmd/kubelet GOFLAGS=-v

# 编译kubectl
# make all WHAT=cmd/kubectl GOFLAGS=-v

* 编译完的kubeadm在 _output/bin/kubeadm 目录下，其中bin是使用了软连接，真实路径是_output/local/bin/linux/amd64/kubeadm

mv /usr/bin/kubeadm /usr/bin/kubeadm_bak
cp _output/local/bin/linux/amd64/kubeadm /usr/bin/kubeadm
chmod +x /usr/bin/kubeadm
```
