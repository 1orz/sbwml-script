#!/bin/bash
rm -rf $0
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo >/dev/null 2>&1
wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo >/dev/null 2>&1
yum install -y epel-release >/dev/null 2>&1
yum install -y gd perl libsodium libsodium-devel openssl openssl-devel c-ares >/dev/null 2>&1
rpm -ivh lnmp/*.rpm --force --nodeps
\cp -rf lnmp/lnmp /usr/bin/lnmp && chmod +x /usr/bin/lnmp
rm -rf lnmp/
mysqladmin -u root password "$1" > /dev/null 2>&1

