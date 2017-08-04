#!/bin/bash
PROJECT_NAME='keywordfinder'
CHECKOUT_HOME='/home/nick/PycharmProjects/'

#
# info var1(default) var2 var3
function read_until_right() {

    read -p "$1" input
    if test -z ${input}
    then
         input="0"
    fi

    found=0
    for e in "$@"
    do
        #echo "param ${e} "
        if [ "${e}" = "${input}" ]
        then
            found=1
        fi
    done

    if [ ${found} -eq 1 ]
    then
        return "${input}"
    else
        echo "invalid input,please input again."
        read_until_right "$@"
    fi

}