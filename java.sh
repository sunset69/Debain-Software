#!/bin/bash

# 定义要安装的软件列表
packages="openjdk-8-jdk maven"
logs="install.log"

echo "更新软件源..."
sudo apt update > /dev/null
echo "更新完成"
echo

java -version

# 循环安装软件
for package in $packages
do
    echo "正在安装 $package ..."
    apt-get install -y $package > $logs
    if [ $? -eq 0 ]; then
        echo "$package 安装成功！"
    else
        echo "$package 安装失败！"
    fi
    echo
done

echo "所有软件已安装完成！"

