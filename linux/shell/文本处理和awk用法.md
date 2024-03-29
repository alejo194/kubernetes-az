##### 文本的非交互处理
+ Shell内建的机制
   - 重定向、管道、命令替换
   - 字符串截取
+ 检索及过滤工具
   - grep行检索
   - expr、cut字符串切割
   - tr字符替换
   - awk、sed专用工具
##### awk内置变量
+ 有特殊含义，可直接使用
``` bash
变量                                    用途
FS                保存或设置字段分隔符，例如 FS=":"
$n                指定分隔的第n个字段，如$1,$3分别表示第1，第3lie
$0                当前读入的整行文本内容
NF                记录当前处理行的字段个数（列数）
NR                记录当前已读入行的数量（行数）
FNR               保存当前处理行在文本的序号（行号）
FILENAME          当前处理的文件名
ENVIRON           调用Shell环境变量，格式：ENVIRON["变量名"]
```
##### awk处理的时机
+ 行前处理，BEGIN{}
    - 读入第一行文本之前执行
    - 一般用来初始化操作
+ 逐行处理，{}
    - 逐行读入文本执行相应的处理
    - 是最常见的编辑指令块
+ 行后处理，END{}
    - 处理完最后一行文本之后执行
    - 一般用来输出处理结果
##### 使用正则条件
+ 正则表达式
    - /正则表达式/
    - ~ 匹配、 !~ 不匹配
```bash
   用例：
   awk -F: '/^ro/{print}' /etc/passwd
   awk -F: '$7!~/bash$/{print$1,$7}' /etc/passwd
```
##### 使用数值比较
+ 数值比较
    - == 等于、 != 不等于
    - > 大于、 >= 大于或等于
    - < 小于、 <= 小于或等于
```bash
   用例：
   awk 'NR==2{print}' reg.txt
   awk '$2!="XX"{print}' reg.txt
   awk 'NF>=2{print}' reg.txt
```
##### 多个条件的组合
+ 逻辑比较测试
    - && 逻辑与：期望多个条件都成立
    - || 逻辑或：只要有一个条件成立即满足要求
```bash
   用例：
   awk -F: '$3>=0&&$3<2{print $1,$3}' /etc/passwd
   awk -F: '$3==1||$3==7{print $1,$3}' /etc/passwd
```
##### 变量的运算
+ 运算符
    - +，-，*，/，%
    - ++， --， +=， -=， *=， /=
```bash
   用例：
   awk 'NR%2==1{print}' reg.txt
   awk 'BEGIN{i=0}{i+=NF}END{print i}' reg.txt
   seq 200|awk 'BEGIN{i=0}($0%3==0)&&($0%13==0){i++}END{print i}'
```
##### if分支结构
```bash
   用例：
   awk -F: 'BEGIN{i=0;j=0}{if($3<=500){i++}else{j++}}END{print i,j}' /etc/passwd
```
