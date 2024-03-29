#!/bin/bash

# Git のコミッタを変更する

read -p 'コミッタ情報を変更する場合は y を入力してください :' yn

if [ ! "${yn}" = 'y' ]; then
  echo '中止します。'
  exit 1
fi

# ↓ 自分の情報に変えてね
git config user.name 'Neos21'
git config user.email 'neos21@gmail.com'

echo '変更しました'
