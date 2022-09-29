#!/bin/bash

# 自分のリポジトリ一覧の JSON を取得する
# 
# リポジトリ数が100件を超えているので複数ページ分用意しておく


curl -s 'https://api.github.com/users/Neos21/repos?per_page=100&page=1' > repos-1.json
curl -s 'https://api.github.com/users/Neos21/repos?per_page=100&page=2' > repos-2.json
curl -s 'https://api.github.com/users/Neos21/repos?per_page=100&page=3' > repos-3.json
jq -s add repos-1.json repos-2.json repos-3.json > repos.json
rm repos-1.json repos-2.json repos-3.json

# 自分が作ったリポジトリを作成日順に並べる
# $ jq -r 'map(select(.fork == false)) | sort_by(.created_at) | map(.created_at + " : " + .name)[]' repos.json
