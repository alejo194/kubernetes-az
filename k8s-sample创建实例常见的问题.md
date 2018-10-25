1.NodePort所开端口会映射到每个work node上<br/>
kube-proxy会将container port映射到NodePort；<br/>
通过命令lsof -i:30001查看NodePort是否开启<br/>
如果端口已经打开，但是其他节点无法访问，注意查看防火墙设置，ufw disable 关闭防火墙即可。<br/>
也可能是kube-proxy没有开启，NodePort没有开放到node上<br/>
