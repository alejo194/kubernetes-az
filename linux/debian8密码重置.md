```bash
1. 在GRUB的引导装载程序菜单上，选择你要进入的条目，输入“e”进入编辑模式
2. 光标在quiet后面增加 init=/bin/bash
   按ctrl-x 或f10启动机器
3. 输入 mount -o remount, rw /
4. 输入 passwd
5. 输入新密码和确认密码
   会有修改成功显示
6. 重启debian
```
参考：https://www.cnblogs.com/hui413027075/p/8342200.html
