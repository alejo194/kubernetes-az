##### ls列表顺序
+ 默认按字母升序排列
  - -S: 按文档大小降序排列
  - -t: 按文档的修改时间降序排列
  - -r: 反序排列
##### uniq去重工具
+ uniq 只能去除连续的重复
+ uniq [OPTION]... [FILE]...
    - -c: 显示每行重复出现的次数
    - -d: 仅显示重复过的行
    - -u: 仅显示不曾重复的行
    - 注：连续且完全相同方为重复
+ 常和sort命令一起配合使用：
    - sort userlist.txt | uniq -c
    - cat /var/log/httpd/access_log |cut -d" " -f1 |sort |uniq -c |sort -nr |head
##### sort排序工具
+ 常用命令选项
   - -u: 去除重复行
   - -n: 按数字排序升序排序
   - -r: 反向排序
   - -R: 随机排序
   - -f: 选项忽略（fold）字符串中的字符大小写
   - -t c: 选项使用c做为字段界定符
   - -k X: 优先对第几列的内容排序
##### wc
   - -l 行

##### sed

##### paste 

##### cut -d' ' -f 5 /etc/passwd

##### 复制对文件改变patch
+ diff 命令的输出被保存在一种叫做“补丁”的文件中
    - 使用 -u 选项来输出“统一的（unified）”diff格式文件，最适用于补丁文件
+ patch 复制在其他文件中进行的改变（要谨慎使用）
    - 适用 -b 选项来自自动备份改变了的文件
    - $ diff -u foo.conf foo2.conf>foo.patch
    - $ patch -b foo.conf foo.patch
