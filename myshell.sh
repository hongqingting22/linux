#!/bin/bash
echo "hello world"

a=10
echo "---$a"
unset a
echo "+++$a"

readonly b=9
echo "b=$b"
unset b
echo "b=$b"

A=`ls /home`
echo "A=$A"
B=$(ls /home)
echo "B=$B"


echo "---------------"
echo "$0 $1 $2"
echo "$*"
echo "$@"
echo "num=$#"

echo "--------------运算符--------------"
RES=$((2*(4+1)))
echo "RES=$RES"
RES2=$[2*(4+1)]
echo "RES2=$RES2"
echo "---expr方式---"
TEMP=`expr 4 + 1`
RES3=`expr $TEMP \* 2`
echo "RES3=$RES3"

echo "----------计算两个参数的和------------"
RES=$[$1+$2]
echo "RES=$RES"


echo "----------判断逻辑---------"
#ok是否=ok
if [ "OK" = "OK" ]
then echo "equals"
fi
#32是否大于23
if [ 32 -gt 23 ]
then echo "yes"
fi
#文件是否存在
if [ -e /root/log.txt ]
then echo "exists"
fi

echo "----------流程控制----------"
#判断参数大小
if [ $1 -gt $2 ]
 then echo "greater"
elif [ $1 -eq $2 ]
 then echo "equals"
elif [ $1 -lt $2 ]
 then echo "littler"
fi

echo "----------case语句----------"
#输出第一个参数对应的星期
case $1 in
"1")
echo "星期一"
;;
"2")
echo "星期二"
;;
*)
echo "其他"
;;
esac

 #打印命令行输入的参数 会使用到$@  $*
echo "----------for循环----------"
for i in $*
  do echo "the num is $i"
done
echo "----------"
for j in $@
  do echo "the num is $j"
done

#for循环第二种方法
echo "----------for循环2-----------"
SUM=0
for ((i=1;i<=100;i++))
 do SUM=$[$SUM+$i]
done
echo "SUM=$SUM"

#while循环
echo "---------while循环----------"
SUM=0
i=0
while [ $i -le $1 ]
 do 
   SUM=$[$SUM+$i]
   i=$[$i+1]
done
echo "SUM=$SUM"

#控制台输入
echo "----------控制台输入---------"
read -p "请输入一个数字num=" NUM
echo "您输入的数字为num=$NUM"

read -t 10 -p "请输入一个数字num1=" NUM1
echo "您输入的数字为num1=$NUM1"

#系统函数
echo "---------获取文件名----------"
basename /root/log/log.txt
basename /root/log/log.txt .txt
dirname /root/log/log.txt

#自定义函数
echo "-----------自定义函数----------"
function sum(){
  SUM=$[$N+$M]
  echo "和是$SUM"
}
read -p "请输入第一个数字n:" N
read -p "请输入第二个数字m:" M
#调用函数
sum $N $M

sum $1 $2
