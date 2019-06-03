
> for循环： for arg in Range; do CMD; done
循环常见场景：
```bash
1,有限数字（用空格隔开或{1,2,...}）
2,序列数据（seq 开始 步长 最后）---步长默认1
3，命令结果（默认空格为分隔符）
4，语法循环（类似C,注意为双括号，分号隔开）
for ((i=1;i<3;i+=2));do echo i ;done
for ((;;);do echo"无限循环";done
5，其他情况
具体情况，具体分析
```

> 算术运算
shell中涉及的算术计算与其他语言一样（或其他语言与shell一样，顺序请强迫症者忽略），有加（+）、减（-）、乘（*）、除（/）、取模（\）、取余（%）、求幂（**）
```bash
方法一，中括号：[...] ##中括号完成算术执行，需通过"$"引用打印出来
echo $[2+3]
方法二，双小括号：((...)) ##等同于let
echo $((3+2)) ##echo $"let 3+2"
方法三，let、expr表达式
let i=3+2; echo $i;
echo $(expr $i * 3); (运算符之间要有空格，否则全部不执行运算全部输出)
注意：bash不支持浮点类型计算，以上都只能实现整数运算。浮点的运算需要使用bc/awk
echo 0.5*4-0.2|bc;
echo $(awk 'BEGIN{print 0.5*4-0.2}')；
```

> if判断
```bash
格式：if条件；then cmd; elif cmd; else cmd; fi
条件格式要求：中括号两端有至少一个空格，如[ *** ];判断符中间也需要空格，否则执行虽然不报错但不是我们要的结果！

常用的条件：
数值判断
数字1 -eq 数字2　　 两数相等为真 （equal）
数字1 -ne 数字2　　 两数不等为真 （not equal）
数字1 -gt  数字2　　 数字1大于数字2为真 （great than）
数字1 -ge 数字2 　　数字1大于等于数字2为真 （great equal）
数字1 -lt   数字2　　 数字1小于数字2为真 （less than）
数字1 -le  数字2　　 数字1小于等于数字2为真 （less equal）

文件判断
-e  文件是否存在（目录或普通文件，exists） 【示例：[ -e ./02.txt ] && echo "hehe"，这是一种简版的if判断，先执行中括号内部命令，true则执行&&后的命令；】
-f  是否为普通文件 （file）【示例：[ -f ./02.txt ] && echo "heh"】
-d  是否为目录文件（directory）【示例：[ -d ./111 ] && echo "heh"】 　  
-r  文件权限：是否可读（read） 【示例：[ -r ./111 ] && echo "heh"】
-w  文件权限：是否可写（write） 【示例：[ -w ./111 ] && echo "heh"】
x  文件权限：是否可执行（execute） 【示例：[ -x ./111 ] && echo "heh"】

字符段判断
==  是否相同（测试“=”也可以）【[ "hehe" == "xizao"  ] && echo "good"】
!=  是否不等  【[ "hehe" ！= "xizao"  ] && echo "good"】
-z  是否为空（长度是否为0）  【[ -z "" ] && echo "good"】
```
