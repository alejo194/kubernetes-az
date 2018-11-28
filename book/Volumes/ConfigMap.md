+ ConfigMap将应用所需的配置信息与程序进行分离，这样就可以是应用程序被更好地复用，通过不同的配置能实现更灵活的功能。
+ 使用kubectl describe or kubectl get检索ConfigMap信息
#### 1. ConfigMap: 容器应用配置管理
ConfigMap供容器使用的典型用法如下。<br/>
(1) 生成为容器内的环境变量。<br/>
(2) 设置容器启动命令的启动参数（需设置为环境变量）。<br/>
(3) 以Volume的形式挂载为容器内部的文件或目录。<br/>
ConfigMap以一个或多个key:value的形式保存在Kubernetes系统中供应用使用，既可以用于表示一个变量的值（例如：apploglevel=info）,也可以用于表示一个完整<br/>
配置文件的内容（例如：server.xml=<?xml...>...）<br/>
可以通过yaml配置文件或者直接使用kubectl create configmap命令行的方式来创建ConfigMap.

#### 2.ConfigMap的创建：yaml文件方式


#### 3.ConfigMap的创建：kubectl命令行方式
+ Create ConfigMaps from directories
```bash
mkdir -p /var/maxwin/configmap
wget https://k8s.io/docs/tasks/configure-pod-container/configmap/kubectl/game.properties -O /var/maxwin/configmap/game.properties
wget https://k8s.io/docs/tasks/configure-pod-container/configmap/kubectl/ui.properties -O /var/maxwin/configmap/ui.properties
kubectl create configmap game-config --from-file=/var/maxwin/configmap

root@de9-74:/var/maxwin/k8s-file/configmap# kubectl describe configmaps game-config
Name:         game-config
Namespace:    default
Labels:       <none>
Annotations:  <none>

Data
====
game.properties:
----
enemies=aliens
lives=3
enemies.cheat=true
enemies.cheat.level=noGoodRotten
secret.code.passphrase=UUDDLRLRBABAS
secret.code.allowed=true
secret.code.lives=30
ui.properties:
----
color.good=purple
color.bad=yellow
allow.textmode=true
how.nice.to.look=fairlyNice

Events:  <none>
root@de9-74:/var/maxwin/k8s-file/configmap# kubectl get configmaps game-config -o yaml
apiVersion: v1
data:
  game.properties: |-
    enemies=aliens
    lives=3
    enemies.cheat=true
    enemies.cheat.level=noGoodRotten
    secret.code.passphrase=UUDDLRLRBABAS
    secret.code.allowed=true
    secret.code.lives=30
  ui.properties: |
    color.good=purple
    color.bad=yellow
    allow.textmode=true
    how.nice.to.look=fairlyNice
kind: ConfigMap
metadata:
  creationTimestamp: 2018-11-28T07:58:13Z
  name: game-config
  namespace: default
  resourceVersion: "3384508"
  selfLink: /api/v1/namespaces/default/configmaps/game-config
  uid: 5b22aed1-f2e3-11e8-8da2-000c2906738c
```
