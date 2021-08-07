#!/bin/bash

# 指定のコマンドを1つずつ、順に確認しながら実行する


# 実行したいコマンドを配列で定義する
cmds=(
  'echo Hello'
  'echo Hoge'
  'echo Fuga'
  'echo End'
)

# コマンドを順に確認しながら実行する
for cmd in "${cmds[@]}"; do
  # 未入力は許可しない
  while : ; do
    read -p "次を実行します。よろしいですか？ [ $ ${cmd} ] : " confirm
    if [ -n "${confirm}" ]; then
      break
    fi
  done
  
  # 先頭1文字のみ取得する
  confirm="${confirm:0:1}"
  
  if [ "${confirm}" = 'y' -o "${confirm}" = 'Y' ]; then
    # y か Y なら eval で実行する
    eval "${cmd}"
  elif [ "${confirm}" = 's' -o "${confirm}" = 'S' ]; then
    # s か S ならこのコマンドをスキップして続行する
    echo 'スキップします'
  else
    # それ以外はスクリプトを中止する
    echo '中止します'
    exit 1
  fi
done
