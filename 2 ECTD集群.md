### 安装etcd
> 官网下载最新的二进制文件etcd https://github.com/coreos/etcd/releases/
> 本测试环境用的etcd version：v3.3.0

### 创建 TLS 秘钥和证书
```bash
cat > etcd-csr.json << EOF
{
  "CN": "etcd",
  "hosts": [
    "127.0.0.1",
    "192.168.40.171"
  ],
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "CN",
      "ST": "BeiJing",
      "L": "BeiJing",
      "O": "k8s",
      "OU": "System"
    }
  ]
}
EOF
```
+ hosts 字段指定授权使用该证书的 etcd 节点 IP；
### 生成 etcd 证书和私钥：
```bash
$ cfssl gencert -ca=/etc/kubernetes/ssl/ca.pem \
  -ca-key=/etc/kubernetes/ssl/ca-key.pem \
  -config=/etc/kubernetes/ssl/ca-config.json \
  -profile=kubernetes etcd-csr.json | cfssljson -bare etcd
$ ls etcd*
etcd.csr  etcd-csr.json  etcd-key.pem etcd.pem
$ sudo mkdir -p /etc/etcd/ssl
$ sudo mv etcd*.pem /etc/etcd/ssl
$ rm etcd.csr  etcd-csr.json
```
### 创建 etcd 的 systemd unit 文件
```bash
$ sudo mkdir -p /var/lib/etcd  # 必须先创建工作目录
$ cat > /etc/systemd/system/etcd.service <<EOF
[Unit]
Description=Etcd Server
After=network.target
After=network-online.target
Wants=network-online.target
Documentation=https://github.com/coreos

[Service]
Type=notify
WorkingDirectory=/var/lib/etcd/
ExecStart=/usr/bin/etcd \
  --name=deb8-171 \
  --cert-file=/etc/etcd/ssl/etcd.pem \
  --key-file=/etc/etcd/ssl/etcd-key.pem \
  --peer-cert-file=/etc/etcd/ssl/etcd.pem \
  --peer-key-file=/etc/etcd/ssl/etcd-key.pem \
  --trusted-ca-file=/etc/kubernetes/ssl/ca.pem \
  --peer-trusted-ca-file=/etc/kubernetes/ssl/ca.pem \
  --initial-advertise-peer-urls=http://192.168.40.171:2380 \
  --listen-peer-urls=http://192.168.40.171:2380 \
  --listen-client-urls=http://192.168.40.171:2379,http://127.0.0.1:2379 \
  --advertise-client-urls=http://192.168.40.171:2379 \
  --initial-cluster-token=etcd-cluster-0 \
  --initial-cluster=deb8-171=http://192.168.40.171:2380,deb8-172=http://192.168.40.172:2380,deb8-173=http://192.168.40.173:2380\
  --initial-cluster-state=new \
  --data-dir=/var/lib/etcd
Restart=on-failure
RestartSec=5
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
EOF
```
+ 指定 etcd 的工作目录和数据目录为 /var/lib/etcd，需在启动服务前创建这个目录；
+ 为了保证通信安全，需要指定 etcd 的公私钥(cert-file和key-file)、Peers 通信的公私钥和 CA 证书(peer-cert-file、peer-key-file、peer-trusted-ca-file)、客户端的CA证书（trusted-ca-file）；
+ --initial-cluster-state 值为 new 时，--name 的参数值必须位于 --initial-cluster 列表中；<br/>
完整 unit 文件见：[etcd.service](https://github.com/alejo194/kubernetes-az/blob/master/systemd/etcd.service)

