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
