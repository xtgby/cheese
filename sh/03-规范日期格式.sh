#!/bin/bash
#normdate -- 将月份规范成3个字母，首写字母大写。
#该脚本随后将作为脚本07的辅助函数
#如果没有错误，那么以0值退出
monthNumToName()
{
#将变量month设置为相应的值
case $1 in
  1 ) month="Jan" ;;
  2 ) month="Feb" ;;
  3 ) month="Mar" ;;
  4 ) month="Apr" ;;
  5 ) month="May" ;;
  6 ) month="Jun" ;;
  7 ) month="Jul" ;;
  8 ) month="Aug" ;;
  9 ) month="Sep" ;;
  10 ) month="Oct" ;;
  11 ) month="Nov" ;;
  12 ) month="Dec" ;;
  * ) echo "$0: Unknow numeric month value $1" >&2
esac
return 0
}

#主脚本开始--- 如果要将该脚本包含到其他脚本之内，那么删除或者注释掉本行以下的所有内容
#=============
#正常情况下只能接受August 3 1962 and 8 3 1962。改为可以接受MM/DD/YYYY 和 MM-DD-YYYY
if [ $# -eq 1 ] ; then
  set -- $(echo $1 | sed 's/[\/\-]/ /g')
fi
#输入验证。
if [ $# -ne 3 ] ; then
  echo "Usage: $0 month day year" >&2
  echo "Formats are July 14 1999 or 7 14 1999 or 07/14/1999 and 07-14-1999" >&2
  exit 1
fi
if [ $3 -le 99 ] ; then
  echo "$0: expected 4-digit year value." >&2
  exit 1
fi
# 输入的月份是否为数字？
if [ -z $(echo $1 |sed 's/[[:digit:]]//g') ] ; then
	#移除所有数字，如果为空则使用函数匹配改为字母。
  monthNumToName $1
else
#规范前3个字母，首字母大写，其余小写
month="$(echo $1|cut -c1|tr '[:lower:]' '[:upper:]')"
month="$month$(echo $1|cut -c2-3|tr '[:upper:]' '[:lower:]')"
fi

echo $month $2 $3
exit 0
