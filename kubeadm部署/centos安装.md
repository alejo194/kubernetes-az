```bash
kubeadm init --control-plane-endpoint "10.40.201.251:7443"   --apiserver-advertise-address 10.40.201.111   --apiserver-bind-port 6443   --upload-certs   --kubernetes-version v1.24.2   --service-cidr=10.1.0.0/16  --pod-network-cidr=10.244.0.0/16
```
+ containered 创建配置文件
>  containerd config default | sudo tee /etc/containerd/config.toml
