```bash
1.odbc安装
yum install -y unixODBC unixODBC-devel libtool-ltdl libtool-ltdl-devel
2freedts（参考https://blog.csdn.net/weixin_38641983/article/details/82997301?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.nonecase&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.nonecase）
下载地址 https://distfiles.macports.org/freetds/?C=N;O=D
>>odbc.ini
[MAXBUS]
Description = MAXBUS
Driver = FreeTDS
Trace = No
Servername = maxbusserver
Database = maxbus
UserName = dev
Password = sqladm@151

[Default]
Driver = /usr/local/freetds/lib/libtdsodbc.so

>>odbcinst.ini
[FreeTDS]
Description = tdsodbc
Driver = /usr/local/freetds/lib/libtdsodbc.so
#Setup = /usr/lib/x86_64-linux-gnu/odbc/libtdsS.so
CPTimeout       = 5
CPReuse         = 5
FileUsage       = 1
```bash
