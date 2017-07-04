#! /bin/sh

grep -h "^deb.*$1" /etc/apt/sources.list.d/* > /dev/null 2>&1
if [ $? -ne 0 ]
then
    add-apt-repository -y ppa:$1
    return 0
fi
