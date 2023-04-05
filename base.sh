#!/bin/bash

# 定义要安装的软件列表
packages="neovim ranger git wget fzf ufw nodejs"
logs="install.log"

echo "更新源中..."
sudo apt-get -qq update
echo "更新源完成"
echo

# 循环安装软件
for package in $packages
do
    echo "正在安装 $package ..."
    sudo apt-get install -y $package >> $logs
    if [ $? -eq 0 ]; then
        echo "$package 安装成功！"
    else
        echo "$package 安装失败！"
    fi
    echo
    echo>>$logs
done

echo "所有软件已安装完成！"

