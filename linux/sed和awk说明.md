#### sed 和 awk
     1，awk: 按列（域）操作； sed: 按行操作
     2，awk: 文本处理器，适用于对文本进行抽取处理；sed: 非交互式的编辑器，适合对文本进行编辑
#### sed

#### awk
     awk 常用选项： -F 分割参数
         常用变量：$n 表示当前记录第n个字段, $0 表示执行过程中当前行的文本内容, $NR 表示当前号（行数）, $NF 表示列数（列数）
                  FS 保存或设置字段分隔符，例如FS=":"， FNR 保存当前处理行在原文本内的序列号（行号），FILENAME 当前处理的文件名
                  ENVIRON 调用Shell环境变量，格式：ENVIRON["变量名"]
https://www.cnblogs.com/quincyhu/p/5884390.html</br>
awk练习：</br>
https://www.cnblogs.com/snsdzjlz320/p/5691280.html</br>
