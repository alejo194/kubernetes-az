# kubernetes-az
## 从头开始安装k8s
参考https://www.jianshu.com/nb/11187620<br/>
kubeadm 搭建https://www.cnblogs.com/dszazhy/p/14704087.html<br/>
多master https://www.jianshu.com/p/b0138cf76882<br/>
         https://www.cnblogs.com/zhaoya2019/p/13032218.html<br/>
         https://github.com/HikoQiu/kubeadm-install-k8s<br/>
软件负载均衡：<br/>         
https://www.cnblogs.com/zhangmingcheng/p/13646907.html<br/>
使用 kube-vip 搭建高可用 K8S 集群<br/>
https://iswbm.com/358.html<br/>
##### 文档说明
https://www.yuque.com/coolops/kubernetes/qmwb72 <br/>
https://www.yuque.com/ssebank/ongd21/oiaa1g <br/>
##### k8s官网
https://kubernetes.io/zh/docs/concepts/workloads/pods/

```bash

kubeadm 证书问题
问题
通过 kubeadm部署k8s，默认生成的证书有效期是一年.需要每年更新证书.

查看证书有效期
kubeadm alpha certs check-expiration
1
更新证书
kubeadm alpha certs renew all
1
通过crontab定时更新证书
0 0 15 10 * kubeadm alpha certs renew all

证书过期kubectl命令无法使用
# 更新客户端配置
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
