#!/bin/bash

# Fmie--primary Menu Script
# Author: Fmie
# Current Version: v1.0.0
# Latest Version: v1.2.2

source "$(dirname "$0")/utils.sh"

echo "                      ___   ___              _ "
echo " ___  ___ _ ____   __/ _ \\ / _ \\       _ __ | | __ _ _   _ "
echo "/ __|/ _ \\ '__\\ \\ / / | | | | | |_____| '_ \\| |/ _\` | | | |"
echo "\\__ \\  __/ |   \\ V /| |_| | |_| |_____| |_) | | (_| | |_| |"
echo "|___/\\___|_|    \\_/  \\___/ \\___/      | .__/|_|\\__,_|\\__, |"
echo "                                      |_|            |___/ "
echo "Current Version: v1.0.0  Latest Version: v1.2.2"
echo "==================================================================="

options=(
  "2) sun-panel"
  "3) webssh"
  "6) 设置保活的项目"
  "12) 系统初始化"
  "13) 前置工作及设置中国时区"
  "17) 显示本机IP"
  "20) 端口管理"
  "21) 域名证书管理"
  "22) 一键root"
  "23) 自动检测主机IP状态"
  "25) KeepAlive"
  "26) Domains-Support"
)

echo "请选择一个选项:"
for option in "${options[@]}"; do
  echo "$option"
done
echo "请选择(输入0退出):"

read choice
case $choice in
  0) exit 0 ;;
  2) echo "Running sun-panel setup..." ;;
  3) echo "Running webssh setup..." ;;
  6) bash "$(dirname "$0")/keepalive.sh" ;;
  12) echo "Running system initialization..." ;;
  13) echo "Setting up China timezone..." ;;
  17) curl -s icanhazip.com ;;
  20) echo "Managing ports..." ;;
  21) bash "$(dirname "$0")/ssl/cronSSL.sh" ;;
  22) echo "Running one-click root..." ;;
  23) echo "Checking host IP status..." ;;
  25) node "$(dirname "$0")/keepalive/app.js" ;;
  26) echo "Managing domains-support..." ;;
  *) echo "无效选项" ;;
esac