#### Linux如何修改文件打开书

##### shell级限制
通过ulimit -n修改，如执行命令ulimit -n 1000,则表示将当前用户所有进程能打开的最大文件数量设置为1000.

##### 用户级限制
ulimit -n 是设置当前shell的当前用户所有进程能打开的最大文件数量，但是一个用户可能会同时通过多个shell
连接到系统，所以还有一个针对用户的限制，通过修改/etc/security/limits.conf实现，例如，往limits.conf
输入以下内容：
root soft nofile 1000
root hard nofile 1200
soft nofile表示软限制，hard nofile表示硬限制
