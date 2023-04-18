##### k8s使用etcd数据库存储集群中的数据，完全起见，一定要备份
###### kubeadm方式部署：
1 备份
```bash
ETCDCTL_API=3 etcdctl snapshot save /opt/etcd.db \
--endpoints=https://127.0.0.1:2379 \
--cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/server.crt \
--key=/etc/kuberentes/pki/etcd/server.key
```
2 恢复
```bash
# 1 先暂停kube-apiserver和etcd容器：
mv /etc/kubernetes/manifests /etc/kubernetes/manifests.bak
mv /var/lib/etcd /var/lib/etcd.bak

# 2 恢复etcd数据
ETCDCTL_API=3 etcdctl snapshot restore \
/opt/etcd.db --data-dir=/var/lib/etcd 

# 3 启动kube-apiserver 和 etcd容器：
mv /etc/kubernetes/manifests.bak /etc/kubernetes/manifests
```
