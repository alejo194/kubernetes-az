kubectl run -i --tty --image busybox:1.28 dns-test --restart=Never

```bash
kubectl exec ubuntu -it bash
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.
root@ubuntu:/# wget http://download.redis.io/redis-stable/src/redis-trib.rb && \
    mv redis-trib.rb /usr/bin/redis-trib && \
    chmod 777 /usr/bin/redis-trib
```---已废弃

参考url:--https://blog.csdn.net/weixin_39576270/article/details/110515995

+ 创建master
```bash
kubectl exec redis-0 -it bash -n rediscluster
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.
root@redis-0:/data# redis-cli --cluster create  redis-0.redisc-svc.rediscluster:6379
[ERR] Wrong number of arguments for specified --cluster sub command
root@redis-0:/data# redis-cli --cluster create  redis-0.redisc-svc.rediscluster:6379 redis-1.redisc-svc.rediscluster:6379 redis-2.redisc-svc.rediscluster:6379
>>> Performing hash slots allocation on 3 nodes...
Master[0] -> Slots 0 - 5460
Master[1] -> Slots 5461 - 10922
Master[2] -> Slots 10923 - 16383
M: 778ed7bfd771a35aa0ea56ec8d5747827c5f9c2b redis-0.redisc-svc.rediscluster:6379
   slots:[0-5460] (5461 slots) master
M: d4b932a761e2263b40d4695e20e8d1809fa7a226 redis-1.redisc-svc.rediscluster:6379
   slots:[5461-10922] (5462 slots) master
M: 1b3984f71cb0d1b7aab4777559885c57adfe3412 redis-2.redisc-svc.rediscluster:6379
   slots:[10923-16383] (5461 slots) master
Can I set the above configuration? (type 'yes' to accept): yes
>>> Nodes configuration updated
>>> Assign a different config epoch to each node
>>> Sending CLUSTER MEET messages to join the cluster
Waiting for the cluster to join
..
>>> Performing Cluster Check (using node redis-0.redisc-svc.rediscluster:6379)
M: 778ed7bfd771a35aa0ea56ec8d5747827c5f9c2b redis-0.redisc-svc.rediscluster:6379
   slots:[0-5460] (5461 slots) master
M: d4b932a761e2263b40d4695e20e8d1809fa7a226 10.244.3.57:6379
   slots:[5461-10922] (5462 slots) master
M: 1b3984f71cb0d1b7aab4777559885c57adfe3412 10.244.2.56:6379
   slots:[10923-16383] (5461 slots) master
[OK] All nodes agree about slots configuration.
>>> Check for open slots...
>>> Check slots coverage...
[OK] All 16384 slots covered.
```
+ 创建slave1
```bash
redis-cli --cluster add-node  redis-5.redisc-svc.rediscluster:6379 redis-0.redisc-svc.rediscluster:6379  --cluster-slave --cluster-master-id 778ed7bfd771a35aa0ea56ec8d5747827c5f9c2b
>>> Adding node redis-5.redisc-svc.rediscluster:6379 to cluster redis-0.redisc-svc.rediscluster:6379
>>> Performing Cluster Check (using node redis-0.redisc-svc.rediscluster:6379)
M: 778ed7bfd771a35aa0ea56ec8d5747827c5f9c2b redis-0.redisc-svc.rediscluster:6379
   slots:[0-5460] (5461 slots) master
M: d4b932a761e2263b40d4695e20e8d1809fa7a226 10.244.3.57:6379
   slots:[5461-10922] (5462 slots) master
M: 1b3984f71cb0d1b7aab4777559885c57adfe3412 10.244.2.56:6379
   slots:[10923-16383] (5461 slots) master
[OK] All nodes agree about slots configuration.
>>> Check for open slots...
>>> Check slots coverage...
[OK] All 16384 slots covered.
>>> Send CLUSTER MEET to node redis-5.redisc-svc.rediscluster:6379 to make it join the cluster.
Waiting for the cluster to join

>>> Configure node as replica of redis-0.redisc-svc.rediscluster:6379.
[OK] New node added correctly.
```
+ 创建slave2
```bash
redis-cli --cluster add-node  redis-4.redisc-svc.rediscluster:6379 redis-1.redisc-svc.rediscluster:6379  --cluster-slave --cluster-master-id d4b932a761e2263b40d4695e20e8d1809fa7a226
>>> Adding node redis-4.redisc-svc.rediscluster:6379 to cluster redis-1.redisc-svc.rediscluster:6379
>>> Performing Cluster Check (using node redis-1.redisc-svc.rediscluster:6379)
M: d4b932a761e2263b40d4695e20e8d1809fa7a226 redis-1.redisc-svc.rediscluster:6379
   slots:[5461-10922] (5462 slots) master
S: 12a5d84ec7c700130a72be4f2a1f55fd32cd5958 10.244.2.57:6379
   slots: (0 slots) slave
   replicates 778ed7bfd771a35aa0ea56ec8d5747827c5f9c2b
M: 778ed7bfd771a35aa0ea56ec8d5747827c5f9c2b 10.244.1.59:6379
   slots:[0-5460] (5461 slots) master
   1 additional replica(s)
M: 1b3984f71cb0d1b7aab4777559885c57adfe3412 10.244.2.56:6379
   slots:[10923-16383] (5461 slots) master
[OK] All nodes agree about slots configuration.
>>> Check for open slots...
>>> Check slots coverage...
[OK] All 16384 slots covered.
>>> Send CLUSTER MEET to node redis-4.redisc-svc.rediscluster:6379 to make it join the cluster.
Waiting for the cluster to join

>>> Configure node as replica of redis-1.redisc-svc.rediscluster:6379.
[OK] New node added correctly.
```
+ 创建slave3
```bash
redis-cli --cluster add-node  redis-3.redisc-svc.rediscluster:6379 redis-2.redisc-svc.rediscluster:6379  --cluster-slave --cluster-master-id 1b3984f71cb0d1b7aab4777559885c57adfe3412
>>> Adding node redis-3.redisc-svc.rediscluster:6379 to cluster redis-2.redisc-svc.rediscluster:6379
>>> Performing Cluster Check (using node redis-2.redisc-svc.rediscluster:6379)
M: 1b3984f71cb0d1b7aab4777559885c57adfe3412 redis-2.redisc-svc.rediscluster:6379
   slots:[10923-16383] (5461 slots) master
S: 163959ceab3aecc97ebb88cd48db1e3214e53b4e 10.244.1.60:6379
   slots: (0 slots) slave
   replicates d4b932a761e2263b40d4695e20e8d1809fa7a226
S: 12a5d84ec7c700130a72be4f2a1f55fd32cd5958 10.244.2.57:6379
   slots: (0 slots) slave
   replicates 778ed7bfd771a35aa0ea56ec8d5747827c5f9c2b
M: 778ed7bfd771a35aa0ea56ec8d5747827c5f9c2b 10.244.1.59:6379
   slots:[0-5460] (5461 slots) master
   1 additional replica(s)
M: d4b932a761e2263b40d4695e20e8d1809fa7a226 10.244.3.57:6379
   slots:[5461-10922] (5462 slots) master
   1 additional replica(s)
[OK] All nodes agree about slots configuration.
>>> Check for open slots...
>>> Check slots coverage...
[OK] All 16384 slots covered.
>>> Send CLUSTER MEET to node redis-3.redisc-svc.rediscluster:6379 to make it join the cluster.
Waiting for the cluster to join

>>> Configure node as replica of redis-2.redisc-svc.rediscluster:6379.
[OK] New node added correctly.

```
