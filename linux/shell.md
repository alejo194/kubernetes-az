bash特殊特性之：bash命令，key=value
bash特殊特性之：变量

文本处理工具：
   Linux上文本处理三剑客：
       grep: 
       sed:
       awk:
       
       正则表达式：
             分两类：
                 基本正则表达式：BER
                 扩展正则表达式：ERE
       元字符：  
grep:
    grep [OPTIONS] PATTERN [FILE...]
    grep [OPTIONS] [-e PATTERN | -f FILE] [FILE...]
         OPTIONS:
            --color=auto: 对匹配到的文本着色后高亮显示；
            -i: ignorecase,忽略字符的大小写
            -o: 仅显示匹配到字符串本身
            -v, --invert-match: 显示不能被匹配到的行；
            -E: 支持使用扩展的正则表达式元字符；
            -q, --quiet, --slient: 不输出任何信息
            
            -A #: after,
            -B #：before
            -c #: context,前后各#行
         基本正则表达式元字符：
            字符匹配：
               .:匹配任意单个字符
               []:匹配指定范围内的任意单个字符；
               [^]:匹配指定范围外的任意单个字符；
            匹配次数
            位置匹配
            分组及引用
