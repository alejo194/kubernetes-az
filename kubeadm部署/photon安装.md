80
```bash
kubeadm init --control-plane-endpoint "10.*.*.250:7443" \
  --apiserver-advertise-address 10.*.*.80 \
  --apiserver-bind-port 6443 \
  --upload-certs \
  --kubernetes-version v1.23.6 \
  --service-cidr=10.1.0.0/16  \
  --pod-network-cidr=10.244.0.0/16 \
  --ignore-preflight-errors=Swap
```
```bash
info
---
Your Kubernetes control-plane has initialized successfully!

To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

Alternatively, if you are the root user, you can run:

  export KUBECONFIG=/etc/kubernetes/admin.conf

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

You can now join any number of the control-plane node running the following command on each as root:

  kubeadm join 10.*.*.250:7443 --token dg9x447p.0cno6wkk27w1zrecdg \
	--discovery-token-ca-cert-hash sha256:dg36be90d0ee2a7a2b21dea0e353efef6ebcf574d50e4f01484407bfb8ff3f075edg \
	--control-plane --certificate-key dg2a62f1cb5322b9b5979eb911dce2bd2e5b7f1a8dcd38f27fbbce0d144830a16adg

Please note that the certificate-key gives access to cluster sensitive data, keep it secret!
As a safeguard, uploaded-certs will be deleted in two hours; If necessary, you can use
"kubeadm init phase upload-certs --upload-certs" to reload certs afterward.

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 10.*.*.250:7443 --token dg9x447p.0cno6wkk27w1zrecdg \
	--discovery-token-ca-cert-hash sha256:dg36be90d0ee2a7a2b21dea0e353efef6ebcf574d50e4f01484407bfb8ff3f075edg
```
##### 不同的系统组成一个集群
标签添加
https://cloud.tencent.com/developer/ask/220173
```bash
kubectl label node cassandra-2 softey.com/release-id=debian
kubectl label node cassandra-2 softey.com/release-version-id=9
```
+ 80 photon os, 1 debian 导致work节点kubelet 报错 kuberuntime_manager.go:833] "CreatePodSandbox for pod failed" err="open /run/systemd/resolve/resolv.conf ...
解决方案：
```bash
vi /var/lib/kubelet/config.yaml
修改/run/systemd/resolve/resolv.conf 为/etc/resolv.conf

$ systemctl restart kubelet.service
```
