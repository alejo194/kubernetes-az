#### Https、SSL/TLS以及证书入门
##### HTTPS
https是基于TLS/SSL的安全套接字应用层协议，除了传输层进行加密外，其它与常规HTTP协议基本保持一致。所以此处主要介绍后面的TLS/SSL和证书。
##### TLS/SSL
+ TLS是传输层安全协议（Transport Layer Security）的缩写，是一种对基于网络传输的加密协议，可以在受信任的第三方公正基础上做双方的身份认证。TLS可以用在tcp上，也可以用在无连接的UDP报文上。协议规定了身份认证、算法协商、秘钥交换等的实现。
+ SSL是TLS的前身，TLS 1.0通常被标示为SSL 3.1，TLS 1.1为SSL 3.2，TLS 1.2为SSL 3.3。
##### TLS基本运行过程

TLS协议的基本思路是采用非对称加密的算法，客户端先获取到服务器端的公钥，然后用公钥加密信息，服务器端收到密文后，用自己的私钥解密。

##### TLS协议基本过程 ：

客户端向服务器端索要并验证公钥（通过可信任的证书）。

双方协商生成“对话密钥”。

双方采用“对话密钥”进行加密通信。

前两个过程，又称为“握手阶段（handshake）”

这里，存在两个问题：

如何保证公钥在传输的过程中不会被篡改？

将公钥放在数字证书中。只要证书可信，公钥就是可信的。那么问题又来了，证书如何可信，请看证书部分？

公钥加密计算量太大，如何减少消耗的时间？

每一次对法（session)，客户端和服务端都生成一个“对话密钥”（session key），用它来加密信息，由于“对话密钥”是对称加密，所以运算速度非常快，而服务器公钥只用于加密“对话密钥”本身，这样就减少了加密运算的消耗时间。

##### 证书

证书的作用：

加密通信，所有的信息加密传输，第三方无法窃听。

身份验证，防止身份被冒充。
校验机制，一旦被篡改，通信双方会立刻发现。
不同格式证书的转换

一般证书有三种格式：

PEM(.pem) 前面命令生成的都是这种格式，
DER(.cer .der) Windows 上常见
PKCS#12文件(.pfx .p12) Mac上常见
证书的生成

OpenSSL使用x509命令生成证书。自己制作证书有两种方式：一种是Self Signed，另一种是生成自己的CA，然后由这个CA来发布需要的证书。这里需要区分两个概念：证书(certificate)和证书请求(certificate sign request)

证书是自签名或CA签名过的凭据，用来进行身份认证
证书请求是对签名的请求，需要使用私钥进行签名
Self Signed证书

一般自签证书不能用来进行身份认证，如果一个server端使用自签证书，client端要么被设置为无条件信任任何证书，要么需要将自签名证书的公钥和私钥加入受信任的列表。但这样一来就增加了server的私钥泄漏的风险

生成Self Signed证书的过程：

1.生成自签名私钥：openssl genrsa -des3 -out selfsign.key 4096（建议输入密码）
2.生成证书签名请求：openssl req -new -key selfsign.key -out selfsign.csr 
注：selfsign.csr中含有selfsign.key的公钥，保证common Name(CN)是最重要的，它代表你的证书要代表的目标，如果你为网站申请证书，就要添加你的域名。
3.对上一步生成的证书签名请求进行签名：
openssl x509 -req -days 365 -in selfsign.csr -signkey selfsign.key -out selfsign.crt

4.一个比较简单的方法就是用下面的命令，一次生成key和证书
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout privateKey.key -out certificate.crt

注意：确保私钥的安全性，因为该证书无法被吊销

TLS基于CA的身份认证的基本原理

首先，验证方需要信任的CA机构提供一个Root CA证书。（假设Root CA证书在受信任证书列表中，或者可以通过安装“根证书”的方式安装。

然后，被验证方对被验证的证书进行签名（私钥加密），生成待验证的证书。

最后，验证方拿到待验证的证书后，利用Root CA证书中包含的公钥进行解密，得到被验证方的原始证书。

根据RSA的加密原理，如果用Root CA的公钥解密成功，说明待验证证书确实是用Root CA的私钥加密的，可以被认为被验证方是受信的

创建私有CA，然后用该CA给证书进行签名的过程：

1.创建CA私钥：openssl genrsa -des3 -out ca.key 4096

2.生成CA的自签名证书：openssl req -new -x509 -days 365 -key ca.key -out ca.crt   
注：其实CA证书就是一个自签名证书

3.生成服务端私钥 ：openssl genrsa -des3 -out server.key 4096

4.需要签名的对象（服务端）生成证书签名请求：openssl req -new -key server.key -out server.csr 
    注：证书签名请求当中的Common Name必须区别与CA的证书里面的Common Name

5.用步骤2创建的CA证书给步骤4生成的签名请求进行签名
openssl x509 -req -days 365 -in server.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out server.crt

去掉key的密码保护

​ 每次输入密码太繁琐，可以把Key的保护密码去掉。

openssl rsa -in privateKey.key -out server.key.insecure
1
查看证书信息

# 查看KEY信息
> openssl rsa -noout -text -in selfsign.key

# 查看CSR信息
> openssl req -noout -text -in selfsign.csr

# 查看证书信息
> openssl x509 -noout -text -in selfsign.crt

# 验证证书
# 会提示self signed
> openssl verify selfsign.crt

# 因为root.crt 是由test.crt发布的，所以会验证成功
> openssl verify -CAfile test.crt root.crt
