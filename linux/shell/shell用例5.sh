cat pricegame.sh
#!/bin/bash
PRICE=$[RANDOM%2000+1]
TIMES=0
echo "商品实际价格为1-2000之间，猜猜看是多少？"
while true
do
    read -p "请输入你猜的价格数目：" X
    let TIMES++
    if [ $X -eq $PRICE ] ; then
        echo "恭喜你答对了，实际价格是$PRICE"
        echo "你总共猜测了 $TIMES 次"
        exit 0
    elif [ $x -gt $PRICE ] ; then
        echo "太高了！"
    else
        echo "太低了！"
    fi
done
