#!/bin/bash

# 自分のリポジトリ一覧から git clone 用 URL のみ抽出する
# 
# リポジトリ数が100件を超えているので複数ページ分用意しておく


curl -s 'https://api.github.com/users/Neos21/repos?per_page=100&page=1' | jq -r '. | map(.clone_url)[]' | sort
curl -s 'https://api.github.com/users/Neos21/repos?per_page=100&page=2' | jq -r '. | map(.clone_url)[]' | sort
curl -s 'https://api.github.com/users/Neos21/repos?per_page=100&page=3' | jq -r '. | map(.clone_url)[]' | sort
