##### 文本格式转换
+ 基本用法
  - unix2dos linux文件
  - dos2unix windows文件
  
  install unix2dos dos2unix
##### 参数分节必要性/xargs用法
find / | xagrs ls -lh
###### xargs处理参数调用
+ 文件改名/复制等操作
  - 选项 -I定义标记， 比如-I{}
  - 在目标命令中可以嵌入{}来引用
    ls install.log* | xargs -I{} cp {} {}.new
