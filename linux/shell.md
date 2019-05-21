```bash
bash特殊特性之：bash命令，key=value
bash特殊特性之：变量

文本处理工具：
   Linux上文本处理三剑客：
       grep,egrep,fgrep: 文本过滤工具
           grep：基本正则表达式，-E， -F
           egrep: 扩展正则表达式，-G, -F
           fgrep：不支持正则表达式，
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
               *：匹配前面字符任意次数，0,1，多次
               .*: 匹配任意长度的任意字符（贪婪匹配）
               \?：匹配其前面字符0或1次
               \+: 匹配其前面字符1次或多次
               \{m\}: 匹配前面字符m次
               \{m,n\}: 匹配前面字符至少m次，至多n次
                   \{0,n\}: 至多n次
                   \{m,\}：至少m次
            位置匹配
               ^: 行首锚定；用于模式的最左侧
               $: 行尾锚定；用于模式的最右侧
               ^PATTERN$: 用PATTERN来锚定整行
                   ^$:空白行
                   ^[[:space:]]$:
               \< 或 \b：词首锚定，用于单词模式的左侧；
               \> 或 \b：词尾锚定，用于单词模式的右侧
               \<PATTERN\>: 匹配完整单词
            分组及引用
               \(\):将一个字符或多个字符捆绑在一起，当作一个整体进行处理；
                   \(xy\)*ab
                Note: 分组括号中的模式匹配到的内容会被正则表达式引擎自动记录于内部的变量中，这些变量为：
                      \1
                      \2
                      \3
                      ...
                      
                后向引用： 引用前面的分组括号的模式所匹配到的字符；
                [:digit:] 所有数字，相当于0-9
                [:lower:] 所有的小写字母
                [:upper:] 所有的大写字母
                [:alpha:] 所有的字母
                [:alnum:] 相当于0-9a-zA-Z
                [:space:] 空白字符
                [:punct:] 所有标点符号
egrep:
    用来支持扩展正则表达式，实现类似于grep文本过滤，grep -E
    
    扩展正则表达式的元字符
       字符匹配:
          .:
          []:
          [^]:
       次数匹配:
          *:
          ?:
          +:
          {m}:
          {n,m}:
       位置锚定:
           \<, \b:
           \>, \b:
       分组及引用:
          ():分组，括号内的模式匹配到的字符会被记录与正则表达式引擎的内部变量中；
          后向引用： \1, \2, ....
       或:
          a|b:
    
fgrep:不支持正则表达式元字符：
    当无需要用到元字符去编写模式时，使用fgrep必能更好；
  
文本查看及处理工具：wc,cut, sort, uniq, diff, patch
    wc: word count
        wc [OPTION] ... [FILE] ...
           -l: lines
           -w: words
           -c: bytes
     cut:
          cut OPTION ... [FILE] ...
              OPTION:
                  -d CHAR: 以指定的字符为分隔符：
                  -f FIELDS: 挑选出的字段；
                        #： 指定的单个字符
                        #-#: 连续的多个字符
                        #,#: 离散的多个字符
                        
     sort:
         -n:基于数值大小而非字符进行排序
         -t CHAR：指定分隔符
         -k #：用于排序比较的字符
         -r: 降序排序；
         -f: 忽略字符大小写
         -u: 重复的行只保留一份（连续且相同）
         
     uniq:报告或移出相同的行
         -c:显示每行重复的次数
         -u:仅显示不重复的行
         -d:显示重复的行
     diff: 逐行比较文件的内容
         diff /path/to/oldfile /path/to/newfile > /path/to/patch_file
         -u: 使用unfied机制，即显示要修改的行的上下文，默认为3行
     patch：向文件打补丁
         patch [OPTIONS] -i /path/to/patch_file /path/to/oldfile
         
         patch /path/to/oldfile < /path/to/patch_file

sed: 自动编辑一个或多个文件、简化对文件的反复操作、编写转换程序等
    sed [OPTION]... {script-only-if-no-other-script} [input-file]...
        -e: 直接在命令模式上进行sed动作编辑，此为默认选项
        -i: 直接修改文件内容
        -n: 只打印模式匹配的行
        -r：支持扩展表达式
        -f: 将sed的动作写在一个文件内，用--f filename执行filename内的sed动作
    
```
