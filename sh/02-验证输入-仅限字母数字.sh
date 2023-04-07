#!/bin/bash
# validAlphaNum -- 确保输入内容仅限于字母和数字

validAlphaNum()
{
# 返回值：如果输入内容全部都是字母和数字，那么返回0；否则返回1。
# 删除所有不符合要求的字符
validchars="$(echo $1 |sed -e 's/[^[:alnum:]]//g')"
#alnum是posix的正则表达式。代表所有字母数字字符。
#sed 's/[^[:upper:],.]//g代表大小写字母、空格、逗号、点号
#sed 's/[^- [:digit:]\(\)]//g 代表允许整数、空格、括号、连字符、但是不允许前导空格或者连续多个空格。类似电话号
#sed 's/[^[:diggit:]]//g'代表仅为整数值。
echo $1
echo $(echo $1 |sed -e 's/[^[:alnum:]]//g')
if [ "$validchars" = "$1" ] ; then
  return 0
else
  return 1
fi
}
#主脚本开始-- 如果要将该脚本包含到其他的脚本之内，那么删除或注释掉本行以下的所有内容
#==============
/bin/echo -n "Enter input:"
read input
#输入验证
if ! validAlphaNum "$input" ; then
  echo "Your input must consist of only letters and numbers." >&2
  exit 1
else
 echo "Input is valid"
fi
exit 0
