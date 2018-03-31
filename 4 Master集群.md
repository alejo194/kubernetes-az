### 1.检查环境
请先确保前面的环境正常, 再进行这一步, 否则出现的各种错误很难定位
### 检查证书环境
![检查证书环境](./images/kubernetes-ssl.png)
### 检查kubectl工具类环境
![kubectl环境](./images/kubernetes.png)
### 检查当前用户信息
![current user](./images/current-user.png)
### 检查服务环境
![kubernetes环境](./images/kube-bin.png)

### 2.配置和启动
```bash
vi /etc/systemd/system/kube-apiserver.service
[Unit]
Description=Kubernetes API Service
Documentation=https://github.com/GoogleCloudPlatform/kubernetes
After=network.target
After=etcd.service

[Service]
EnvironmentFile=-/etc/kubernetes/config
EnvironmentFile=-/etc/kubernetes/apiserver
ExecStart=/usr/local/bin/kube-apiserver \
    $KUBE_LOGTOSTDERR \
    $KUBE_LOG_LEVEL \
    $KUBE_ETCD_SERVERS \
    $KUBE_API_ADDRESS \
    $KUBE_API_PORT \
    $KUBELET_PORT \
    $KUBE_ALLOW_PRIV \
    $KUBE_SERVICE_ADDRESSES \
    $KUBE_ADMISSION_CONTROL \
    $KUBE_API_ARGS
Restart=on-failure
Type=notify
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
```
***配置config***
```bash
vi /etc/kubernetes/config
KUBE_LOGTOSTDERR="--logtostderr=true"
KUBE_LOG_LEVEL="--v=0"
KUBE_ALLOW_PRIV="--allow-privileged=true"
KUBE_MASTER="--master=http://192.168.40.171:8080"

vi /etc/kubernetes/apiserver
KUBE_API_ADDRESS="--advertise-address=192.168.40.171 --bind-address=192.168.40.171 --insecure-bind-address=192.168.40.171"
KUBE_ETCD_SERVERS="--etcd-servers=http://192.168.40.171:2379,http://192.168.40.172:2379,http://192.168.40.173:2379"
KUBE_SERVICE_ADDRESSES="--service-cluster-ip-range=10.254.0.0/16"
KUBE_ADMISSION_CONTROL="--admission-control=ServiceAccount,NamespaceLifecycle,NamespaceExists,LimitRanger,ResourceQuota"
KUBE_API_ARGS="--authorization-mode=RBAC --runtime-config=rbac.authorization.k8s.io/v1beta1 --kubelet-https=true --experimental-bootstrap-token-auth --token-auth-file=/etc/kubernetes/token.csv --service-node-port-range=30000-32767 --tls-cert-file=/etc/kubernetes/ssl/kubernetes.pem --tls-private-key-file=/etc/kubernetes/ssl/kubernetes-key.pem --client-ca-file=/etc/kubernetes/ssl/ca.pem --service-account-key-file=/etc/kubernetes/ssl/ca-key.pem --enable-swagger-ui=true --apiserver-count=3 --audit-log-maxage=30 --audit-log-maxbackup=3 --audit-log-maxsize=100 --audit-log-path=/var/lib/audit.log --event-ttl=1h"
```
