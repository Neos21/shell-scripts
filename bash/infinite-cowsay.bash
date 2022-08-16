#!/bin/bash

# 無限 Cowsay するワンライナー
# 
# - 準備 (MacOS) : `$ brew install cowsay fortune lolcat`

while :; do reset && fortune | cowsay -f $(cowsay -l | grep -v '^Cow' | tr ' ' '\n' | shuf -n 1) | lolcat; sleep 5; done

# Memo
# 
# - コマンド案
#   $ fortune | cowsay | lolcat
#   $ cmdsay | lolcat
# - ランダムで AA を決める方法
#   $ fortune | cowsay -f "$(ls /usr/local/Cellar/cowsay/*/share/cows/ | shuf -n1)"
#   $ aa=($(cowsay -l | grep -v '^Cow' | cut -f1-)); fortune | cowsay -f "${aa[$((RANDOM%${#aa[@]}))]}"
#   $ fortune | cowsay -f $(cowsay -l | grep -v '^Cow' | sed -e ':loop; N; $!b loop; s/ /\n/g' | shuf -n 1)  # MacOS は gsed を使う
#   $ fortune | cowsay -f $(cowsay -l | grep -v '^Cow' | tr ' ' '\n' | shuf -n 1)
# - リセット
#   $ reset
#   $ printf '\033[H\033[2J'
