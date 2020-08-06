```bash
1. 查看集群有多少个Node
$ kubectl get nodes
2. 查看某个node的详细信息
$ kubectl describe node <node名字>
3. Pod有Event记录，查看描述信息
$ kubectl describe pod xxx
4. Pod的动态缩放
$ kubectl scale rc redis-slave --replica=3
5. EndPoint列表
$ kubectl get endpoints
6. 查看Service被分配的Cluster IP及更多信息
$ kubectl get svc xxxservice -o yaml
```
