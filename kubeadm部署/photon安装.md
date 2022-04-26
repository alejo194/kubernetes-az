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
