##### 创建证书，以及cert存储方式
```bash
$ openssl req -x509 -sha256 -nodes -days 356 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj
  "/CN=nginxsvc/0=nginxsvc"
$ kubectl create secret tls tls-secret --key tls.key --cert tls.crt
```

##### deployment、 Service、Ingress Yaml 文件
```bash
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: nginx-test
spec:
  tls:
    - hosts:
      - foo.bar.com
      secretName: tls-secret
  rules:
    - host: foo.bar.com
      https:
      - path: /
        backend:
          serviceName: nginx-svc
          servicePort: 80
```
