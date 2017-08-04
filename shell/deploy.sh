#!/bin/bash

#test and import env.sh
[ -e `dirname $0`/env.sh ]  && . `dirname $0`/env.sh

#echo ${PROJECT_NAME}
#echo `date "+%Y-%m-%d"`
#echo $(date "+%Y-%m-%d")
#A=(a b c def)
#echo ${A[3]}
#echo ${#A[@]}
#a1=1;a2=2;a3=3
#echo $((a1+a2+a3))
#s1="China is an lovely country."

read_until_right "choose which to deploy(0|enter all,1 api,2 web): " "0" "1" "2"

echo "read_until_right output : $? "









#if [ ${app} == '1' ]
#then
#   echo "a 等于 b"
#elif [ ${app} == '2' ]
#then
#   echo "a 大于 b"
#elif [ ${app} == '0' ]
#then
#   echo ""
#else
#   echo read_until_right '$@'
#fi


