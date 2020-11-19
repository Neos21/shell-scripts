# 起動を速くしたり動作を軽くしたりするための研究資料

2018-12-18 : Git SDK の起動を速くしたい


## 事前確認

- `git-sdk-installer-1.0.7-64.7z.exe` を `C:\git-sdk-64\` にインストール後、1回以上普通に起動した状態から調査・改良を開始した
- `C:\git-sdk-64\` ディレクトリの `git log` は以下のとおり。
  - `74eb921e 2018-12-18 Update 20181218-031256 [Git for Windows Build Agent] (grafted, HEAD -> master, origin/master)`
- `C:\git-sdk-64\.git\` ディレクトリを消しておかないと、`/` が Git 管理されているテイになっているので、Git 管理外のディレクトリでも `__git_ps1` が表示されてしまう


## 調査

- Git SDK (`git-bash.exe`) を起動すると、3秒くらい時間がかかっている
- 起動時にどのようなファイルが読み込まれているか調べるため、`/usr/bin/bash.exe` の動作ログを出力してみる

```sh
$ PS4='+$BASH_SOURCE> ' BASH_XTRACEFD=7 bash -xl 7>&2
```

- `bash.exe` が立ち上がると、`C:\git-sdk-64\etc\profile` = `/etc/profile` が読み込まれ、このファイルから次のファイル群が `source` される
  - `/etc/msystem` : `MSYSTEM_PREFIX` など環境変数を設定する
  - `/etc/post-install/` 配下の全ファイル : インストール直後の初期設定がメイン。設定ができていたら結果的に何もしないのだが、Git SDK を起動するたびに `source` するので遅くなっている
    - `/etc/post-install/01-devices.post` : `/dev/` 配下のシンボリックリンクを作成する
    - `/etc/post-install/03-mtab.post` : `/proc/mounts` の再現
    - `/etc/post-install/06-windows-files.post` : `C:\Windows\System32\drivers\etc\` との設定
    - `/etc/post-install/07-pacman-key.post` : `pacman-key` の設定
    - `/etc/post-install/08-xml-catalog.post` : `xmlcatalog` の用意
    - `/etc/post-install/99-post-install-cleanup.post` : 不要なファイルの削除
  - `/etc/profile.d/` 配下のファイル : `perlbin.csh` 以外が呼ばれる
    - `/etc/profile.d/aliases.sh` : `alias` 設定
    - `/etc/profile.d/bash_completion.sh` : Bash タブ補完用ファイル `/usr/share/bash-completion/bash_completion` を読み込む
    - `/etc/profile.d/bash_profile.sh` : `~/.bash_profile`・`~/.bashrc` などのファイルの存在チェック・なければ新規生成する
    - `/etc/profile.d/env.sh` : 環境変数 `PATH` の設定
    - `/etc/profile.d/git-prompt.sh` : 環境変数 `PS1` (プロンプト) の設定
    - `/etc/profile.d/git-sdk.sh` : `sdk` 関数の用意。`Welcome to the Git for Windows SDK!` のメッセージはこのスクリプトが出力している
    - `/etc/profile.d/lang.sh` : 環境変数 `LANG` (言語) の設定
    - `/etc/profile.d/perlbin.sh` : Perl に関する環境変数 `PATH` の設定
    - `/etc/profile.d/tzset.sh` : 環境変数 `TZ` (タイムゾーン) の設定
  - `/etc/bash.bashrc` : プロンプトの設定など
- この `/etc/profile` とそこから読み込まれる外部ファイル群から「無駄」を省いていけば速くなるかも
  - MSYS 系の様々な環境で汎用的に動作するように書かれているので、32 bit 版向けに無駄な条件分岐や処理が含まれていたりする
  - SSH 接続時の調整など、自分の用途ではまず使わない場合向けの設定が含まれている
- Windows の Git Bash (MSYS) はそもそも遅いもの
  - Windows OS 自体が、Unix 系と比べてファイルアクセスやプロセス生成が遅い
- 対策
  - ファイルアクセスを減らす
    - `test` などでファイルの存在チェックをしている箇所を削る
    - 外部ファイルの `source` を止め、`/etc/profile` 内にインラインで書いてしまう
  - 余計にプロセス生成しないようにする
    - `exec` を始めとするコマンドの使用箇所を極限まで削る
    - 違いがあるか分からないが、変数展開や変数置換、関数呼び出しなども削る
- 速くするためなら自分の環境にのみ依存するようなカスタマイズでもいとわない


## 作業経過

- `profile　v0 元ファイル`
  - インストール直後の `/etc/profile` そのまま
- `profile　v1 外部ファイルをインライン化・不要箇所をコメントアウト`
  - `source` しているファイルの中身をインラインにコピペした
  - 条件分岐や変数の設定内容などを細かく見ていき、余計な処理をコメントアウトした
  - 調査時のコメントも記してあるので、問題があった時はこのファイルを基に原因調査できる
- `profile　v2 コメントアウトを除去・完成版`
  - `v1` ファイルのコメントアウトを除去してファイルサイズを小さくした
  - `PATH` など複数回設定されていた変数を1回で設定するようにした
  - `export` コマンドの実行を1回にまとめ、中身が空の変数は `export` しないようにした
  - `C:\git-sdk-64\etc\profile` = `/etc/profile` のファイルの内容をこのファイルの内容に差し替えてしまえば高速化できる


## 高速化結果

- `/etc/profile` の1行目と最終行、`~/.bash_profile` の最終行 (`~/.bashrc` の読込後) の3箇所に以下のコマンドを仕掛けた

```sh
date '+%F %T %N'
# 'YYYY-MM-DD HH:mm:ss ナノ秒' が出力される
```

- `v0` (元々の `/etc/profile`) の状態で起動
  - `sdk()` 関数の `welcome` の内容が出力されている
  - `/etc/profile` の実行には2秒近くかかっている
  - `~/.bash_profile` の実行にも時間がかかっているが、コレはこのファイルから `~/.bashrc` や `git-completion.bash` などを `source` していたりするため。ユーザ定義の場所なので参考程度に

```sh
# git-bash.exe から起動した場合
2018-12-20 22:04:54 425751900  # /etc/profile 開始
Welcome to the Git for Windows SDK!

The common tasks are automated via the `sdk` function;
See `sdk help` for details.
2018-12-20 22:04:56 071816800  # /etc/profile 終了
2018-12-20 22:04:56 648292200  # ~/.bash_profile 終了

# ConEmu 経由で起動した場合
2018-12-20 22:05:18 909422700
Welcome to the Git for Windows SDK!

The common tasks are automated via the `sdk` function;
See `sdk help` for details.
2018-12-20 22:05:20 651132500
2018-12-20 22:05:21 200182800

# VSCode ターミナルで起動した場合
2018-12-20 22:06:28 762942800
Welcome to the Git for Windows SDK!

The common tasks are automated via the `sdk` function;
See `sdk help` for details.
2018-12-20 22:06:30 144222500
2018-12-20 22:06:30 610625700
```

- `v1` の `/etc/profile` での起動の様子
  - `/etc/profile` の読み込みは 0.04 秒程度で完了するようになった

```sh
# git-bash.exe から起動した場合
2018-12-20 22:08:34 101682800
2018-12-20 22:08:34 146045500
2018-12-20 22:08:34 592678200

# ConEmu 経由で起動した場合
2018-12-20 22:09:52 155827500
2018-12-20 22:09:52 184454600
2018-12-20 22:09:52 588958800

# VSCode ターミナルで起動した場合
2018-12-20 22:10:04 455038800
2018-12-20 22:10:04 503452800
2018-12-20 22:10:04 962285900
```

- `v2` (完成版) の `/etc/profile` での起動の様子
  - コメントアウトを省いたりしただけなので、実行速度としてはほぼ変化はなかった

```sh
# git-bash.exe から起動した場合
2018-12-20 22:32:09 508269500
2018-12-20 22:32:09 548539700
2018-12-20 22:32:09 983198600

# ConEmu 経由で起動した場合
2018-12-20 22:32:40 392795500
2018-12-20 22:32:40 445522000
2018-12-20 22:32:40 944811000

# VSCode ターミナルで起動した場合
2018-12-20 22:33:05 313265200
2018-12-20 22:33:05 365957600
2018-12-20 22:33:05 965419300
```

- 2秒近くかかっていた `/etc/profile` の読み込みを 0.04 秒程度に削れた
- こうなったら `~/.bash_profile`・`~/.bashrc` の読み込み速度も気になるので、調整できたら調整したい


---


## おまけ : Git SDK を他所で使う

- ConEmu で Git SDK を使う : 次のように起動タスクを設定する

```dosbatch
set "PATH=C:\git-sdk-64\usr\bin;%PATH%" & "C:\git-sdk-64\git-cmd.exe" --no-cd --command=%ConEmuBaseDirShort%\conemu-msys2-64.exe /usr/bin/bash.exe -l -i -new_console:p
```

- VSCode で Git SDK を使う : `settings.json` に次のように設定する

```json
"terminal.integrated.shell.windows": "C:\\git-sdk-64\\usr\\bin\\bash.exe",
"terminal.integrated.shellArgs.windows": ["-l"],
```
