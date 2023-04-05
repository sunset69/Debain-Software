#!/bin/bash

# 定义要安装的软件列表
packages="pm2"
logs="install.log"

#检测nodejs是否安装
sudo apt install nodejs
if [ $? -eq 0 ]; then
    node -v
    echo "nodejs已安装！"
else
    echo "nodejs未安装！"
    exit 1
fi

#检测npm是否安装
sudo apt install npm
if [ $? -eq 0 ]; then
    echo "npm已安装！"
else
    echo "npm未安装！"
    exit 1
fi

# 循环安装软件
for package in $packages
do
    echo "正在安装 $package ..."
    npm install -g -y $package >> $logs
    if [ $? -eq 0 ]; then
        echo "$package 安装成功！"
    else
        echo "$package 安装失败！"
    fi
    echo
    echo>>$logs
done

echo "所有软件已安装完成！"
