#!/bin/bash
DEPLOY_HOME='/home/cafintech/App/' #application deploy dictionary
BACKUP_HOME='/home/cafintech/Backup/' #application backup dictionary

WEB_APP_NAME='web'
API_APP_NAME='api'

PROJECT_NAME='keywordfinder'
CHECKOUT_HOME='/home/nick/PycharmProjects/'


function check_env() {
    echo "##############################################################"
    echo "# before deploy must prepare [java  git  maven  nginx] in env."
    echo "# app use spring boot with embed tomcat"
    echo "##############################################################"
}


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


function git_mvn_package() {
    echo '$0'
    if test -e "${CHECKOUT_HOME}${PROJECT_NAME}"
    then
        echo 'git pull...'
        cd "${CHECKOUT_HOME}${PROJECT_NAME}"
        git pull
    else
        echo "${CHECKOUT_HOME}${PROJECT_NAME} not exists,try 'git checkout'."
        git clone https://github.com/tfnick/keywordfinder.git
        cd "${CHECKOUT_HOME}${PROJECT_NAME}"
        #`mvn clean package -p prod`
    fi
}

function deploy_api() {
    echo "$0"
    backup ${API_APP_NAME}
    t_file="${CHECKOUT_HOME}${PROJECT_NAME}/target/YYYY.tar.gz"
    cp -R ${t_file} "${DEPLOY_HOME}${API_APP_NAME}"
    tar -xvf ${t_file}
    rm -f ${t_file}

    cd "${DEPLOY_HOME}${APIAPP_NAME}/bin"

    sh stop.sh

    nohup sh start.sh &
}

function deploy_web() {
    echo "$0"
    backup ${WEB_APP_NAME}
    t_file="${CHECKOUT_HOME}${PROJECT_NAME}/target/XXXX.tar.gz"
    cp -R ${t_file} "${DEPLOY_HOME}${WEB_APP_NAME}"
    tar -xvf ${t_file}
    rm -f ${t_file}

    cd "${DEPLOY_HOME}${WEB_APP_NAME}/bin"

    sh stop.sh

    nohup sh start.sh &
}

function deploy_api_web() {
    echo "$0"
    deploy_api
    deploy_web
}

function backup() {
    app=$1
    t_dir="${BACKUP_HOME}${app}/`date "+%Y%m%d-%H%M%S"`"
    s_dir="${DEPLOY_HOME}${app}"
    mkdir -p ${t_dir}
    mkdir -p ${s_dir}
    cd ${s_dir}
    cp -R * ${t_dir}

    rm -fr *
}