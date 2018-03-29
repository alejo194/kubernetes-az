kubectl是k8s集群的命令行工具, 基本上整个集群的运维操作都靠它, 所以需要事先配置好它
## k8s运行环境配置
官网下载二进制文件：https://kubernetes.io/docs/imported/release/notes/#downloads-for-v1100
```bash
$ wget https://storage.googleapis.com/kubernetes-release/release/v1.10.0/kubernetes-server-linux-amd64.tar.gz
$ tar -zxvf kubernetes-server-linux-amd64.tar.gz
$ cd kubernetes/server/bin
$ cp -r {kube-apiserver,kube-controller-manager,kube-scheduler,kubelet,kube-proxy,kubectl} /usr/local/bin/
```
> Master只需要启动3个服务, 分别为kube-apiserver, kube-controller-manager, kube-scheduler
> Node只需要启动2个服务, 分别为kubelet, kube-proxy
##  创建kubectl kubeconfig文件
```bash
cd /etc/kubernetes
export KUBE_APISERVER="https://192.168.40.171:6443"

# 设置集群参数
kubectl config set-cluster kubernetes \
  --certificate-authority=/etc/kubernetes/ssl/ca.pem \
  --embed-certs=true \
  --server=${KUBE_APISERVER}

# 设置客户端认证参数
kubectl config set-credentials admin \
  --client-certificate=/etc/kubernetes/ssl/admin.pem \
  --embed-certs=true \
  --client-key=/etc/kubernetes/ssl/admin-key.pem

# 设置上下文参数
kubectl config set-context kubernetes \
  --cluster=kubernetes \
  --user=admin

# 设置默认上下文
kubectl config use-context kubernetes
```
