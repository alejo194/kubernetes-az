cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

cat <<EOF |  tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sysctl --system
update-alternatives --set iptables /usr/sbin/iptables-legacy
update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
update-alternatives --set arptables /usr/sbin/arptables-legacy
update-alternatives --set arptables /usr/sbin/arptables-legacy
update-alternatives --set ebtables /usr/sbin/ebtables-legacy
update-alternatives --set arptables /usr/sbin/arptables-legacy
update-alternatives --set ebtables /usr/sbin/ebtables-legacy
apt-get update && sudo apt-get install -y apt-transport-https curl
apt-get update &&  apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg |  apt-key add -
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg |  apt-key add -
curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add -
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg |  apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

cat <<EOF | tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg |  apt-key add -
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg |  apt-key add -
apt-get update
apt-get update
apt-get update
kubectl get pods -n kube-system
kubectl get nodes
docker images
kubectl get nodes
kubectl get pods -n kube-system
docker ps
kubectl get pods -n kube-system
kubectl get pods
kubectl describe pods -n kube-system
kubectl
kubectl logs pod/coredns-6d56c8448f-rdpx4
kubectl logs pods/coredns
kubectl logs pods
kubectl get p
kubectl logs
kubectl logs -p
kubectl describe pods -n kube-system
kubectl get pods -n kube-system
kubectl logs -p coredns-6d56c8448f-rdpx4
kubectl get pods -n kube-system
kubectl describe coredns -n kube-system
kubectl describe coredns-6d56c8448f-rdpx4 -n kube-system
kubectl describe pods coredns-6d56c8448f-rdpx4 -n kube-system
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
vi sudo vim /etc/hosts
vi /etc/hosts
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
ls
ls
cd mkdir/
ls
cd ..
ls
rm -rf mkdir/
ls
scp -r /etc/cni root@192.168.101.80:/etc
scp -r /run/flannel/ root@192.168.101.80:/run
cd /run/flannel/
ls
cat subnet.env
:q
kubeadm init --apiserver-advertise-address=192.168.101.81   --image-repository registry.aliyuncs.com/google_containers --kubernetes-version v1.19.0 --service-cidr=10.1.0.0/16 --pod-network-cidr=10.244.0.0/16 --ignore-preflight-errors all
kubectl get pods -n kube-system
kubectl get nodes
kubectl get cs
kubectl get pods -n kube-system
curl -k https://localhost:6443/healthz
cd /var/maxwin/
ls
mkdir k8s
cd k8s/
wget https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
vi kube-flannel.yml
kubectl get pods -n kube-system
root@de9-75:~# cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF

apt-get install sude
apt-get install sudo
root@de9-75:~# cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF

root@de9-75:~# cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF

cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

cat <<EOF >  /etc/apt/sources.list.d/kubernetes.list
deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
EOF

curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add -
apt-get update
apt-get install -y  kubeadm=1.19.0-00 kubelet=1.19.0-00 kubectl=1.19.0-00
htop
swapoff -a
free
 vi  /etc/fstab
vi /etc/hosts
docker ps
docker -v
kubeadm init --apiserver-advertise-address=192.168.101.81   --image-repository registry.aliyuncs.com/google_containers --kubernetes-version v1.19.0 --service-cidr=10.1.0.0/16 --pod-network-cidr=10.244.0.0/16
systemctl daemon-reload docker
systemctl daemon-reload docker.service
systemctl daemon-reload
systemctl restart docker.service
history
kubeadm init --apiserver-advertise-address=192.168.101.81   --image-repository registry.aliyuncs.com/google_containers --kubernetes-version v1.19.0 --service-cidr=10.1.0.0/16 --pod-network-cidr=10.244.0.0/16
docker image
docker images
kubeadm config images pull
vi /var/lib/kubelet/kubeadm-flags.env
mkdir mkdir /var/lib/kubelet/
vi /var/lib/kubelet/kubeadm-flags.env
kubeadm init --apiserver-advertise-address=192.168.101.81   --image-repository registry.aliyuncs.com/google_containers --kubernetes-version v1.19.0 --service-cidr=10.1.0.0/16 --pod-network-cidr=10.244.0.0/16
systemctl daemon-reload
systemctl restart kubelet
kubeadm config images pull
kubeadm init --apiserver-advertise-address=192.168.101.81   --image-repository registry.aliyuncs.com/google_containers --kubernetes-version v1.19.0 --service-cidr=10.1.0.0/16 --pod-network-cidr=10.244.0.0/16
docker images
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
cat /etc/kubernetes/admin.conf
kubectl get nodes
kubectl get nodes
kubeadm token list
kubectl get nodes
kubectl get pods -n kube-system
kubectl describe pods coredns-6d56c8448f-rdpx4 -n kube-system
kubectl get nodes
kubectl get pods -ll
kubectl get pods -all
kubectl get pods -a
kubectl get pods --help
kubectl get pods --help
kubectl get pods -A
kubectl -help
kubectl --help
kubectl explain pods
kubectl describe pods -A
kubectl --help
kubectl get pod -n kube-system -o wide
kubectl get pods --help
kubeadm init --apiserver-advertise-address=192.168.101.81   --image-repository registry.aliyuncs.com/google_containers --kubernetes-version v1.19.0 --service-cidr=10.1.0.0/16 --pod-network-cidr=10.244.0.0/16
kubeadm init --apiserver-advertise-address=192.168.101.81   --image-repository registry.aliyuncs.com/google_containers --kubernetes-version v1.19.0 --service-cidr=10.1.0.0/16 --pod-network-cidr=10.244.0.0/16 --ignore-preflight-errors=
kubeadm init --apiserver-advertise-address=192.168.101.81   --image-repository registry.aliyuncs.com/google_containers --kubernetes-version v1.19.0 --service-cidr=10.1.0.0/16 --pod-network-cidr=10.244.0.0/16 --ignore-preflight-errors
kubeadm init --apiserver-advertise-address=192.168.101.81   --image-repository registry.aliyuncs.com/google_containers --kubernetes-version v1.19.0 --service-cidr=10.1.0.0/16 --pod-network-cidr=10.244.0.0/16 --ignore-preflight-errors=all
kubectl get pod -n kube-system -o wide
kubectl get pod -n kube-system -o wide
kubectl get pod -n kube-system -o wide
kubectl get pod -n kube-system -o wide
kubectl get pod -n kube-system -o wide
kubectl get pod -n kube-system -o wide
kubectl get pod -n kube-system -o wide
kubectl get pod -n kube-system -o wide
kubectl get pod -n kube-system -w
kubectl get pod -n kube-system -o wide
kubectl delete node
kubectl delete node --all
kubectl get nodes
kubectl reset
kubectl --help
kubectl drain
kubectl drain -h
setenforce 0
cat /etc/sysctl.d/k8s.conf
systemctl enable kubelet
cat /etc/kubernetes/admin.conf
kubeadm config print init-defaults --component-configs KubeProxyConfiguration
docker ps
kubectl delete pods -A
kubectl delete pods --all
kubeadm alpha certs check-expiration
kubeadm alpha certs renew all
kubeadm alpha certs check-expiration
cd  /etc/kubernetes/pki
ls
ls
scp -rp * server80:/etc/kubernetes/pki
ls
apt-get install ntpdate
ntpdate time.windows.com
apt-get install epel-release -y
