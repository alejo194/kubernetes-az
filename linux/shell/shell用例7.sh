iptables -A INPUT -s 管理机地址 -j ACCEPT   //允许个别访问
iptables -A INPUT -s Web主机地址 -j ACCEPT

iptables -P INPUT DROP     //默认策略拒绝
iptables -p OUTPUT ACCEPT

vim /opt/ipfw.wlist      //白名单
127.0.0.1
192.168.4.110
220.121.72.85

for i in $(cat /opt/ipfw.wlist)    //遍历允许白名单地址
> do
> iptables -I INPUT -s $i -j ACCEPT
> done

vim /opt/ipfw.blist
10.0.0.124
192.168.4.251

for i in $(cat /opt/ipfw.blist)
> do
> iptables -I INPUT -s $i -j DROP
> done


###shell脚本
cat /opt/ipfw.sh
#!/bin/bash
WLIST=$(cat /opt/ipfw.wlist)
BLIST=$(cat /opt/ipfw.blist)
IPT="/sbin/iptables"
# 常规防护规则
/etc/init.d/iptables stop     #清空旧规则
$IPT -P INPUT DROP            #设置新规则
#为白名单中的地址设置信任规则
for i in $WLIST
do 
    $IPT -I INPUT -s $i -j ACCEPT
done
# 为黑名单中的地址设置封杀规则
for i in $BLIST
do 
    $IPT -I INPUT -s $i -j DROP
done
