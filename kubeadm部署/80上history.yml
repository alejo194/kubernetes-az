 1  cd /etc/systemd/
    2  ls\
    3  ls
    4  cd network/
    5  ls
    6  cp 99-dhcp-en.network 10-static-en.network
    7  edit 10-static-en.network
    8  vi 10-static-en.network
    9  chmod 644 10-static-en.network
   10  systemctl restart systemd-networkd
   11  ls
   12  rm -rf 99-dhcp-en.network
   13  systemctl restart systemd-networkd
   14  init 6
   15  tdnf update -y
   16  iptables -F
   17  cd /etc/yum.repos.d/
   18  ls
   19  nano photon.repo
   20  tdnf upgrade -y
   21  nano photon-iso.repo
   22  tdnf upgrade -y
   23  tdnf update -y
   24  nano photon.repo
   25  df -h
   26  curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   27  chmod +x /usr/local/bin/docker-compose
   28  ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
   29  docker-compose version
   30  ln -sf /usr/share/zoneinfo/Asia/Taipei  /etc/localtime
   31  hwclock -w
   32  date
   33  df -h
   34  let photon*.repo enable
   35  ls
   36  nano photon.repo
   37  tdnf install tcpdump
   38  tdnf clean all
   39  tdnf repolist
   40  docker ps
   41  ifconfig
   42  htop
   43  tdnf check-update
   44  tdnf check-local
   45  tdnf distro-sync
   46  tdnf clean
   47  tdnf clean all
   48  tdnf install tcpdump -y
   49  tdnf update -y
   50  w
   51  tdnf install Htop -y
   52  tdnf install htop -y
   53  tdnf install atop -y
   54  tdnf install nmom -y
   55  tdnf install nmon -y
   56  yum install epel-release
   57  docker ps
   58  df -h
   59  free
   60  free -h
   61  htop
   62  top
   63  cd /var/maxwin
   64  mkdir -p /var/maxwin
   65  ls
   66  apt-get install vim
   67  yum install vim
   68  cd /var/maxwin/
   69  ls
   70  yum install git
   71  ping 8.8.8.8
   72  cd /etc/yum.repos.d/
   73  ls
   74  cd /etc/ssh
   75  vi sshd_config
   76  systemctl sshd restart
   77  systemctl restart sshd
   78  cd /etc/yum.repos.d/
   79  ls
   80  vi photon-iso.repo
   81  systemctl start docker
   82  systemctl enable docker
   83  ps aux | grep docker
   84  systemctl status docker
   85  docker ps
   86  docker version
   87  route
   88  cd /etc/systemd/
   89  ls
   90  cd network/
   91  ls
   92  ifconfig
   94  yum install nano -y
   95  rot
   96  route
   97  ls
   98  nano 10-static-en.network
   99  systemctl restart systemd-networkd
  100  iptables -F
  101  iptables -X
  102  iptables -t nat -F
  103  iptables -t nat -X
  104  iptables -t mangle -F
  105  iptables -t mangle -x
  106  iptables -t mangle -X
  107  iptables -P INPUT ACCEPT
  108  iptables -P FORWARD ACCEPT
  109  iptables -P OUTPUT ACCEPT
  110  cd /var/maxwin/
  111  ls
  112  git clone https://bitbucket.org/maxwin-inc/jtt_gateway.git
  113  git clone https://bitbucket.org/maxwin-inc/jtt_media_gateway.git
  114  git clone https://bitbucket.org/maxwin-inc/jtt-auth.git
  115  cd jtt-auth/
  116  ls
  117  vi run.sh
  118  cd ..
  119  vi docker-compose.yml
  120  curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  121   chmod +x /usr/local/bin/docker-compose
  122  docker ps
  123  docker-compose up -d
  124  docker ps
  125  docker logs consul-c
  126  ls
  127  cd consul/
  128  ls
  129  cd ..
  130  vi docker-compose.yml
  131  docker-compose up -d
  132  docker ps
  133  docker logs consul-c --tail=100
  134  docker rm -f consul-c
  135  vi docker-compose.yml
  136  ps -aup
  137  ps -a
  138  htp
  139  top
  140  htop
  141  docker ps -a
  142  ps -a
  143  ps -aux
  144  docker network ls
  145  docker network inspect bridge
  146  netstat -a
  147  netstat -a|grep 8301
  148  vi docker-compose.yml
  149  docker-compose up -d
  150  docker ps
  151  docker logs consul-c
  152  docker rm -f consul-c
  153  netstat -a |grep '8301'
  154  vi docker-compose.yml
  155  netstat -au |grep '8301'
  156  netstat -au
  157  cd /
  158  ls
  159  cd media
  160  lscd /media
  161  ls
  162  ls -lh
  163  cd /run/
  164  ls
  165  iptables
  166  iptables -h
  167  netstat -h
  168  netstat -rlai
  169  netstat -r
  170  netstat -i
  171  netstat -ia
  172  netstat -anp
  173  pm2 ls
  174  consul members
  175  yum install htop
  176  top
  177  htop
  178  yum install htop
  179  top
  180  ps -a|grep 'consul'
  181  top
  182  kill -H 1500
  183  ps -ef |grep consul
  184  consul
  185  consul leave
  186  htop
  187  ps -ef |grep consul
  188  cd /var/maxwin/
  189  ls
  190  docker-compose up -d
  191  docker ps
  192  docker exec -it consul-c consul members
  193  ls
  194  cd au
  195  cd jtt-auth/
  196  ls
  197  vi run.sh
  198  docker ps
  199  cd ..
  200  vi docker-compose.yml
  201  docker-compose up -d
  202  docker ps
  203  cd jtt-auth/
  204  ls
  205  vi docker-compose.yml
  206  vi requirements.txt
  207  vi Dockerfile
  208  sh run.sh
  209  docker network rm jtt-auth_default
  210  docker network ls
  211  ifconfig
  212  ls
  213  vi docker-compose.yml
  214  sh run.sh
  215  iptables -a
  216  iptables -l
  217  iptables -list
  218  iptables -h
  219  iptables --list
  220  vi  /etc/sysconfig/iptables
  221  cd /etc/sysconfig/
  222  ls
  223  docker -v
  224  cd /lib/systemd/system/
  225  ls
  226  vi iptables.service
  227  vi /etc/systemd/scripts/iptables
  228  systemctl restart iptables.service
  229  systemctl status iptables.service
  230  cd /var/maxwin/
  231  ls
  232  cd jtt-auth/
  233  sh run.sh
  234  systemctl stop iptables.service
  235  systemctl status iptables.service
  236  sh run.sh
  237  systemctl restart iptables.service
  238  systemctl status iptables.service
  239  systemctl restart docker.service
  240  systemctl status docker.service
  241  sh run.sh
  242  pkill docker
  243  docker ps
  244  iptables -t nat -F
  245  ifconfig docker0 down
  246  ifconfig
  247  brctl delbr docker bridge
  248  brctl delbr docker0
  249  systemctl start docker
  250  systemctl status docker.service
  251  sh run.sh
  252  docker network create
  253  docker network create --help
  254  docker network create maxwin-net
  255  docker network ls
  256  docker network inspect maxwin-net
  257  vi docker-compose.yml
  258  sh run.sh
  259  ipconfig
  260  ifconfig
  261  sudo pacman -U /var/cache/pacman/pkg/linux-$(uname -r | sed 's/-ARCH//')-
  262   pacman -U /var/cache/pacman/pkg/linux-$(uname -r | sed 's/-ARCH//')-
  263  reboot
  264  ps aux | grep consul
  265  consul leave
  266  docker ps
  267  systemctl disable consul.service
  268  systemctl status docker.s
  269  systemctl status docker.service
  270  docker ps
  271  systemctl status docker.service
  272  uname -r
  273  uname -a
  274  docker info
  275  systemctl status docker.service
  276  docker -v
  277  docker info
  278  docker ps
  279  systemctl status docker.service
  280  docker ps
  281  docker -v
  282  systemctl status docker.service
  283  docker ps
  284  docker ps
  285  vi /etc/docker/
  286  cd /etc/docker/
  287  ls
  288  vi  /etc/docker/daemon.json
  289  systemctl status docker.service
  290  systemctl restart docker.service
  291  ls
  292  vi daemon.json
  293  ocker restart
  294  ls
  295  systemctl reload docker.service
  296  systemctl restart docker.service
  297  ls
  298  rm daemon.json
  299  systemctl restart docker.service
  300  systemctl start docker.service
  301  systemctl start docker
  302  reboot
  303  docker ps
  304  systemctl status docker.service
  305  systemctl start docker.service
  306  journalctl -xe
  307  cd /etc/docker/
  308  ls
  309  vi daemon.json
  310  ls -lh
  311  vi daemon.json
  312  systemctl restart docker.service
  313  systemctl stop docker.service
  314  vi daemon.json
  315  mv daemon.json daemon.conf
  316  systemctl start docker.service
  317  systemctl restart docker.service
  318  docker ps
  319  ps -af |grep docker
  320  ps -a |grep docker
  321  ps  |grep docker
  322  htop
  323  top
  324  ps -ax |grep docker
  325  systemctl stop docker.service
  326  cd /var/maxwin/
  327  ls
  328  vi docker-compose.yml
  329  cat docker-compose.yml
  330  docker pull erlang:18.3
  331  cd /var/maxwin/jtt_gateway/
  332  ls
  333  git pull
  334  cd config/
  335  ls
  336  cp -rp jtt_gateway.config.sample jtt_gateway.config
  337  vi jtt_gateway.config
  338  cd ../..
  339  ls
  340  vi docker-compose.yml
  341  docker ps
  342  docker images
  343  docker logs jtt_auth_py36 --tail=100
  344  vi docker-compose.yml
  345  docker exec -it jtt_auth_py36 sh
  346  docker ps
  347  docker logs db_store --tail=100
  348  docker logs db_store_jw --tail=100
  349  docker ps
  350  cd /var/maxwin/
  351  ls
  352  cd db_store_jw/
  353  ls
  354  vi config/sys.config
  355  docker ps
  356  cd /var/maxwin/
  357  ls
  358  vi docker-compose.yml
  359  docker pull maxwinch/vinbus_right
  360  docker-compose up -d vinbus_right
  361  docker exec -it  vinbus_right_python3.6 sh
  363  docker ps
  364  docker tag db_store:v1 cxhjet/db_store
  365  docker login
  366  docker push cxhjet/db_store
  367  docker logout
  368  docker login
  369  cd /var/maxwin/
  370  cd db_store/
  371  ls
  372  cat config/dbstore.config
  373  cd ..
  374  vi docker-compose.yml
  376  ls
  377  uname
  378  uname -a
  379  modprobe br_netfilter
  380  free -h
  381  docker ps
  382  ls
  383  sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
  384   curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
  385  cd /usr/local/bin/
  386  ls
  387  rm kube*
  388  cd /lib/systemd/
  389  ls
  390  ls -lh
  391  cd system
  392  ls
  393  cd /etc/systemd/system/multi-user.target.wants
  394  ls
  395  ls -lh
  396  ln -s kubelet.service  /lib/systemd/system/kubelet.service
  397  ls -lh
  398  ln -s   /lib/systemd/system/kubelet.service kubelet.service
  399  ls -lh
  400  vi kubelet.service
  401  sudo kubeadm init --pod-network-cidr=10.244.0.0/16
  402   kubeadm init --pod-network-cidr=10.244.0.0/16
  403  mkdir -p $HOME/.kube
  404  cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  405  cat <<EOF | sudo tee /etc/docker/daemon.json
  406  {
  407    "exec-opts": ["native.cgroupdriver=systemd"],
  408    "log-driver": "json-file",
  409    "log-opts": {
  410      "max-size": "100m"
  411    },
  412    "storage-driver": "overlay2"
  413  }
  414  EOF
  415  cat <<EOF |  tee /etc/docker/daemon.json
  416  {
  417    "exec-opts": ["native.cgroupdriver=systemd"],
  418    "log-driver": "json-file",
  419    "log-opts": {
  420      "max-size": "100m"
  421    },
  422    "storage-driver": "overlay2"
  423  }
  424  EOF
  425  systemctl daemon-reload
  426  systemctl restart docker.service
  427   kubeadm init --pod-network-cidr=10.244.0.0/16
  428  kubeadm reset
  429  vi /etc/docker/daemon.json
  430  echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
  431   "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
  432  echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" |  tee /etc/apt/sources.list.d/kubernetes.list
  433   kubeadm init --pod-network-cidr=10.244.0.0/16
  434  docker load -i /tmp/k8s.rar
  435  docker ps
  436  free -h
  437  docker ps
  438  df -h
  439  docker ps
  440   kubeadm init --kubernetes-version=v1.23.6 --pod-network-cidr=10.244.0.0/16
  441  cat << EOF > /etc/yum.repos.d/kubernetes.repo
  442  [kubernetes]
  443  name=Kubernetes Repo
  444  baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
  445  enabled=1
  446  gpgcheck=1
  447  gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
  448  EOF
  449  查看要打包的版本，我以1.18.8版本为例
  450  yum list --showduplicates | grep 'kubeadm\|kubectl\|kubelet' |grep 1.18.8
  451   将所需的安装包离线下载至本地
  452  yum -y install kubelet-1.18.8 kubectl-1.18.8 kubeadm-1.18.8 --downloadonly --downloaddir=./
  453   安装离线包
  454  yum localinstall -y ./*.rpm
  455  查看需要的镜像
  456  kubeadm config images list
  457  可配置设置拉取k8s的源
  458  cat <<EOF > /etc/yum.repos.d/kubernetes.repo
  459  [kubernetes]
  460  name=Kubernetes
  461  baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
  462  enabled=1
  463  gpgcheck=1
  464  repo_gpgcheck=1
  465  gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
  466  EOF
  468  kubeadm init --kubernetes-version=1.18.8 --apiserver-advertise-address=172.17.0.10 --image-repository registry.aliyuncs.com/google_containers --service-cidr=10.1.0.0/16 --pod-network-cidr=10.222.0.0/16

  471  cat <<EOF > /etc/yum.repos.d/kubernetes.repo
  472  [kubernetes]
  473  name=Kubernetes
  474  baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
  475  enabled=1
  476  gpgcheck=1
  477  repo_gpgcheck=1
  478  gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
  479  EOF
  480  vi /etc/yum.repos.d/kubernetes.repo
  481  cat /etc/os-release
  482  ifconfig
  483  ping 8.8.8.8
  484  w
  485  tdnf update -y
  486  cd /etc/systemd/network/
  487  ls -la
  488  cat 10-static-en.network
  489  cd /etc/yum.repos.d/
  490  sed  -i 's/dl.bintray.com\/vmware/packages.vmware.com\/photon\/$releasever/g' photon.repo photon-updates.repo photon-extras.repo photon-debuginfo.repo
  491  vi /etc/selinux/config
  492  tdnf upgrade
  493  tdnf upgrade
  494  yum install -y kubelet -nogpgcheck
  495  vi /etc/yum.repos.d/kubernetes.repo
  496  yum install -y kubelet -nogpgcheck
  497  yum install -y  kubectl kubeadm -nogpgcheck
  498  yum install -y  kubectl kubeadm -nogpgcheck
  499  cat /etc/keepalived/keepalived.conf
  500  cp  /etc/keepalived/keepalived.conf  /etc/keepalived/keepalived.conf-bk
  501  vi /etc/keepalived/keepalived.conf
  502  rm /etc/keepalived/keepalived.conf
  503  cp /etc/keepalived/keepalived.conf-bk /etc/keepalived/keepalived.conf
  504  cd /etc/keepalived/
  505  ls
  506  ls -lh
  507  ls -lha
  508  vi keepalived.conf
  510  ls
  511  vi keepalived.conf
  512  wq
  513  vi keepalived.conf
  520  vi /etc/keepalived/keepalived.conf
  521  ifconfig
  522  ls
  523  vi /etc/keepalived/keepalived.conf
  524  cat /etc/keepalived/keepalived.conf
  525  ps
  526   vi /etc/keepalived/check_nginx.sh
  527  vi /etc/keepalived/keepalived.conf
  528  ls
  529  kubectl get nodes
  530  yum -y install lrzsz
  531  cd /var/maxwin/k8s/
  532  yum -y install lrzsz
  533  yum  install lrzsz
  534  yum install lrzsz
  535  rz -E
  536  yum update
  537  uname -r
  538  uname -A
  539  uname -a
  540  yum install
  541  yum
  542  docker ps
  543  cd /var/maxwin/
  544  ls
  545  cd k8s/
  546  ls
  547  rz -E
  548  **00yum install rz
  549  yum -y install lrzsz
  550  yum update
  551  kubectl logs es-0 -n es
  552  kubectl get pods -n  es
  553  kubectl desribe pods -n  es
  554  kubectl describe pods -n  es
  555  cd /var/maxwin/k8s/es/
  556  ls
  557  kubectl delete -f es-statefulset.yml
  558  kubectl apply -f es-statefulset.yml
  559  kubectl describe es-statefulset.yml
  560  kubectl describe -f es-statefulset.yml
  561  kubectl get pods -n es
  562  kubectl describe pods -n es
  563  kubectl logs pods -n es
  564  kubectl logs es-0 -n es
  565  kubectl get pods -w -n es
  566  kubectl logs pods -n es
  567  kubectl get pods -n es
  568  kubectl exec es-0 -c inites -it -n es sh
  569  kubectl exec es-0 -c inites -it -n es sh
  570  cd /var/maxwin/k8s/es/
  571  ls
  572  vi es-statefulset.yml
  573  kubectl delete -f es-statefulset.yml
  574  kubectl apply -f es-statefulset.yml
  575  kubectl get pods -n es
  576  kubectl exec es-0 -c inites -it -n es sh
  577  cd /var/maxwin/k8s/es/
  578  ls
  579  vi es-statefulset.yml
  581  vi es-statefulset.yml
  582  kubectl describe pods -n es
  583  cd /var/maxwin/k8s/es
  584  ls
  585  kubectl get pvc -n es
  586  cd /var/maxwin/
  587  ls
  588  cd k8s/es/
  589  ls
  590  kubectl get pods -A
  591  kubectl logs es-0 -n es
  592  k
  593  cd /var/maxwin/k8s/es
  594  kubectl apply -f es-statefulset.yml
  595  kubectl get pods -n es
  596  kubectl get pods -n es -o wide
  597  kubectl logs es-0 -n es
  598  kubectl logs es10 -n es
  599  kubectl logs es-1 -n es
  600  ls
  601  vi es-cm.yml
  602  cd /var/maxwin/k8s/es/
  603  ls
  604  vi es-cm.yml
  605  rm /root/.vim/swap//%var%maxwin%k8s%es%es-cm.yml.swp
  606  vi es-cm.yml
  607  kubectl edit cm es -n es
  608  kubectl delete -f es-cm.yml
  609  vi es-cm.yml
  610  kubectl apply -f es-cm.yml
  611  kubectl edit cm es -n es
  612  kubectl delete -f es-statefulset.yml
  613  kubectl apply -f es-statefulset.yml
  614  kubectl logs es-0 -n es
  615  kubectl get pods -n es -o wide
  616  kubectl logs es-0 -n es
  617  kubectl get secret ca -n es
  618  kubectl get secret  -n es
  619  cd /var/maxwin/k8s/es/
  620  ls
  621  vi es-statefulset.yml
  622  cd /var/maxwin/
  623  ls
  624  cd k8s/
  625  ls
  626  cd redis/
  627  ls
  628  vi redis-statefulset.yaml
  629  :q
  630  kubectl get pods
  631  kubectl get pods -n redis
  632  kubectl describe pods -n redis
  633  vi redis-statefulset.yaml
  634  kubectl get pvc -n redis
  635  kubectl edit pvc data-redis-0 -n redis
  636  kubectl detele pvc data-redis-0 -n redis
  637  kubectl delete pvc data-redis-0 -n redis
  638  kubectl delete -f redis-statefulset.yaml
  639  kubectl apply -f redis-statefulset.yaml
  640  kubectl get pods -n redis
  641  kubectl describe pods -n redis
  642  kubectl get cm -n redis
  643  kubectl delete configmap redis-config1
  644  kubectl delete configmap redis-config
  645  kubectl create configmap redis-config --help
  646  kubectl create configmap redis-config --from-file=launch.sh
  647  kubectl delete configmap redis-config
  648  kubectl create configmap redis-config --from-file=launch.sh -n es
  649  kubectl delete -f redis-statefulset.yaml
  650  kubectl apply -f redis-statefulset.yaml
  651  kubectl describe pods -n redis
  652  kubectl delete configmap redis-config  -n es
  653  kubectl create configmap redis-config --from-file=launch.sh -n redis
  654  kubectl delete -f redis-statefulset.yaml
  655  kubectl apply -f redis-statefulset.yaml
  656  cd /var/maxwin/
  657  ls
  658  cd k8s/redis/
  659  kubectl get pods -n redis
  660  kubectl describe pods -n redis
  661  vi redis-statefulset.yaml
  662  kubectl exec redis-0 -it sh -n redis
  663  cd /var/maxwin/k8s/redis/
  664  ls
  665  vi redis-svc.yaml
  666  kubectl get svc -n redis
  667  kubectl delete -f redis-statefulset.yaml
  668  kubectl delete -f redis-svc.yaml
  669  kubectl apply -f redis-svc.yaml
  670  vi launch.sh
  671  cd /var/maxwin/k8s/redis/
  672  ls
  673  kubectl delete -f redis-statefulset.yaml
  674  vi launch.sh
  675  kubectl delete cm --all -n redis
  676  kubectl create cm redis-config --from-file=launch.sh=launch.sh -n redsi
  677  kubectl create cm redis-config --from-file=launch.sh=launch.sh -n redis
  678  kubectl apply -f redis-statefulset.yaml
  679  kubectl get pods -n redis
  680  kubectl exec redis-0 -it sh -n redis
  681  cd /var/maxwin/k8s/redis/
  682  kubectl exec redis-1 -it sh -n redis
  683  cd /var/maxwin/k8s/redis/
  684  kubectl delete -f redis-statefulset.yaml
  685  kubectl apply -f redis-statefulset.yaml
  686  kubectl run -i --tty --image busybox:1.28 dns-test --restart=Never --rmkub
  687  kubectl run -i --tty --image busybox:1.28 dns-test --restart=Never
  688  cd /var/maxwin/k8s/redis/
  689  ls
  690  vi redis-statefulset.yaml
  691  kubectl delete -f redis-statefulset.yaml
  692  kubectl apply -f redis-statefulset.yaml
  693  kubectl get pods -n redis
  694  kubectl exec  redis-1 -it sh  -n redis
  695  vi redis-statefulset.yaml
  696  kubectl delete -f redis-statefulset.yaml
  697  vi launch.sh
  698  kubectl delete -f redis-statefulset.yaml
  699  vi redis-statefulset.yaml
  700  kubectl apply -f redis-statefulset.yaml
  701  kubectl get pods -n redis
  702  kubectl exec  redis-1 -it sh  -n redis
  703  kubectl delete -f redis-statefulset.yaml
  704  vi redis-statefulset.yaml
  705  vi launch.sh
  706  kubectl delete cm --all  -n redis
  707  kubectl create cm redis-config --from-file=launch.sh -n redis
  708  kubectl apply -f redis-statefulset.yaml
  709  kubectl get pods -n redis
  710  kubectl exec redis-1 -it sh -n redis
  711  kubectl logs redis-0 -n redis
  712  kubectl logs redis-1 -n redis
  713  kubectl exec redis-1 -it sh -n redis
  714  xit
  715  cd /var/maxwin/
  716  ls
  717  cd k8s/redis/
  718  ls
  719  vi redis-svc.yaml
  720  cd /var/maxwin/k8s/redis/
  721  ls
  722  vi redis-svc.yaml
  723  kubectl apply -f redis-svc.yaml
  724  cd /var/maxwin/k8s/redis/
  725  ls
  726  vi redis-statefulset.yaml
  727  cat ../es/es-statefulset.yml
  728  vi redis-statefulset.yaml
  729  cd /var/maxwin/
  730  ls
  731  cd k8s/
  732  ls
  733  cd mysql/
  734  ls
  735  vi mysql-ns.yaml
  736  cd ..
  737  ls
  738  cd es/
  739  ls
  740  vi es-statefulset.yml
  741  kubectl delete -f es-statefulset.yml
  742  kubectl get pv -n es
  743  kubectl edit pv es-nfs-pv-0
  744  kubectl edit pv es-nfs-pv-1
  745  kubectl edit pv es-nfs-pv-2
  746  kubectl get pv -n es
  747  kubectl get pvc -n es
  748  kubectl apply -f es-statefulset.yml
  749  kubectl get pods -n es
  750  kubectl logs es-0 -n es
  751  kubectl describe -f es-statefulset.yml
  752  kubectl get pods -n es
  753  kubectl logs es-0 -n es
  754  vi es-statefulset.yml
  755  cd /var/maxwin/
  756  ls
  757  cd k8s/es/
  758  ls
  759  vi persistant-voulmes.yaml
  760  cd /var/maxwin/k8s/redis/
  761  ls
  762  cd ../mysql/
  763  ls
  764  vi mysql-statefulset.yaml
  765  vi mysql-secret.yaml
  766  kubectl apply -f mysql-statefulset.yaml
  767  kubectl get pods -n mysql
  768  kubectl get pods -n mysql -o wide
  769  kubectl delete -f mysql-statefulset.yaml
  770  kubectl apply -f mysql-statefulset.yaml
  771  kubectl get pods -n mysql -o wide
  772  kubectl describe -f mysql-statefulset.yaml
  773  kubectl get pv
  774  kubectl describe -f mysql-statefulset.yaml
  775  kubectl get pods -n mysql -o wide
  776  kubectl logs mysql-0 -n mysql
  777  kubectl logs mysql-0 init-mysql -n mysql
  778  kubectl logs  init-mysql -n mysql
  779  kubectl get pods -n mysql -o wide
  780  cd /var/maxwin/k8s/mysql/
  781  kubectl logs mysql -n mysql
  782  kubectl logs mysql-1 -c mysql -n mysql
  783  cd /var/maxwin/k8s/mysql/
  784  ls
  785  kubectl get pods -n mysql -o wide
  786  kubectl describe mysql-1 -n mysql
  787  kubectl describe pods mysql-1 -n mysql
  788  :q
  789  vi mysql-statefulset.yaml
  790  kubectl get secret -n mysql
  791  kubectl describe secret mysql-secret -n mysql
  792  vi mysql-statefulset.yaml
  793  kubectl describe pods mysql-0 -n mysql
  794  cd ../es
  795  ls
  796  cat es-statefulset.yml
  797  cd ../mysql/
  798  vi mysql-statefulset.yaml
  799  kubectl delete -f mysql-statefulset.yaml
  800  vi mysql-
  801  vi mysql-statefulset.yaml
  802  kubectl delete -f mysql-statefulset.yaml
  803  kubectl apply -f mysql-statefulset.yaml
  804  cd /var/maxwin/
  805  ls
  806  cd k8s/mysql/
  807  ls
  808  vi mysql-statefulset.yaml
  809  kubectl get secret -n mysql
  810  kubectl delete -f mysql-statefulset.yaml
  811  vi mysql-statefulset.yaml
  812  kubectl delete -f mysql-secret.yaml
  813  vi mysql-secret.yaml
  814  kubectl create -f mysql-secret.yaml
  815  kubectl get secret
  816  kubectl get secret -n mysql
  817  kubectl get secret -n mysql -o wide
  818  kubectl get secret -n mysql --labels-show
  819  kubectl get secret -n mysql --show-labels
  820  kubectl apply -f mysql-statefulset.yaml
  821  cd /var/maxwin/k8s/
  822  cd redis/
  823  ls
  824  cd ..
  825  mkdir redis-cluster
  826  ls
  827  free -h
  831  ls
  832  cat chargerState.txt
  833  cd /var/maxwin/k8s/redis-cluster
  834  ls
  835  vi redis-statefulset.yaml
  836  kubectl apply -f redis-statefulset.yaml
  837  kubectl get pods -n rediscluster
  838  kubectl get nodes
  839  kubectl get ns
  840  vi redis-statefulset.yaml
  841  kubectl get statefulset -n rediscluster
  842  kubectl describe statefulset -n rediscluster
  843  kubectl get cm -n rediscluster
  844  vi redis-statefulset.yaml
  845  kubectl delete -f redis-statefulset.yaml
  846  kubectl apply -f redis-statefulset.yaml
  847  kubectl describe statefulset -n rediscluster
  848  kubectl get pods -n rediscluster
  849  kubectl get pods -o wide -n rediscluster
  850  kubectl get pods -o wide --show-labels -n rediscluster
  851  history
