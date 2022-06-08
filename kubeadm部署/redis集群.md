kubectl run -i --tty --image busybox:1.28 dns-test --restart=Never

```bash
kubectl exec ubuntu -it bash
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.
root@ubuntu:/# wget http://download.redis.io/redis-stable/src/redis-trib.rb && \
    mv redis-trib.rb /usr/bin/redis-trib && \
    chmod 777 /usr/bin/redis-trib
```
