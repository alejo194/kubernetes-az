iptables -A INPUT -s 管理机地址 -j ACCEPT   //允许个别访问
iptables -A INPUT -s Web主机地址 -j ACCEPT

iptables -P INPUT DROP     //默认策略拒绝
iptables -p OUTPUT ACCEPT
