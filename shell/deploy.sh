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
echo `date "+%Y%m%d-%H%M%S"`

git_mvn_package

read_until_right "choose which to deploy(0|enter both,1 api,2 web): " "0" "1" "2"

input=$?

if [ "${input}" == '1' ]
then
   echo "deploying api service"
elif [ "${input}" == '2' ]
then
   echo "deploying web service"
else
   echo "deploying api&web service"
fi









