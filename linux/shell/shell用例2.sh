cat ftpuseradd.sh
#!/bin/bash
[ $# -le 0 ] && echo "用法:$0 <学校代号>" && exit 1
UP_USER=$1_upload
UP_PASS=$(uuidgen | cut -b -8)
DOWN_USER=$1_download
DOWN_PASS=$(uuidgen | cut -b -8)
FTP_HOME="/ftproot"
USER_CONFIG_DIR="/etc/vsftpd/conf.d"
#创建上传账号
useradd -d $FTP_HOME/$UP_USER
echo $UP_PASS | passwd --stdin $UP_USER
#创建下载账号
chmod 755 $FTP_HOME/$UP_USER
useradd -d $FTP_HOME/$UP_USER $DOWN_USER
echo $DOWN_PASS |passwd --stdin $DOWN_USER
#建立账号配置
echo "download_enable=NO" > $USER_CONFIG_DIR/$UP_USER
echo "write_enable=NO" > $USER_CONFIG_DIR/$DOWN_USER
#建立账号记录文件
echo "FTP Accounts of $1
Upload User:$UP_USER
Password:$UP_PASS
Download User:$DOWN_USER
Password:$DOWN_PASS" > /root/$1_ftpac.txt
