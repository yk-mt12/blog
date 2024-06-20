# はじめに
今回は以下の記事を見て、最大限効率化するためのスクリプトを作成したのでその紹介です。
https://qiita.com/Sicut_study/items/9b20ac5ded003cb6d55a

# 問題
この記事では「高速に雑に記事を書くフレームワーク」に沿ってアウトプットをを行っていけば、時間をかけずいい感じのアウトプットができるというものでしたが、そもそも怠惰な私にはこのテンプレートを毎回用意するのが面倒だなと感じていました。
似た様なフレームワークを用意して、普段はNotionなどを使用していましたが、最近はいちいちNotionを開いてページ作成して、タグをつけてを毎回していると割と手間がかかってしまう課題があります。

# 解決方法
そこで今回は、ターミナル上からスクリプトをいい感じに実行して、テンプレートを任意のディレクトリに作成して、最速でアウトプットを行うための下地を作りました。

```
#!/bin/bash

# デフォルトのディレクトリと日付の取得
DIRECTORY=~/blog/articles/
DATE=$(date +%Y%m%d)

# 引数が0または1つ必要
if [ $# -gt 1 ]; then
  echo "使用方法: $0 [ファイル名]"
  exit 1
fi

# ファイル名を設定（デフォルトは "blog_post"）
if [ $# -eq 1 ]; then
  BASENAME=$1
else
  BASENAME="post"
fi

FILENAME=$DATE_$BASENAME.md

# 保存先パス
FILEPATH=$DIRECTORY/$FILENAME

# テキスト内容
CONTENT="# はじめに

# 問題

# 解決方法

# おわりに

# 参考
"

# ディレクトリが存在しない場合、作成
if [ ! -d "$DIRECTORY" ]; then
  mkdir -p "$DIRECTORY"
fi

# テキストをファイルに書き込む
echo "$CONTENT" > "$FILEPATH"

echo "ファイルが $FILEPATH に作成されました。"

# VSCodeでファイルを開く
code "$FILEPATH"
```

使い方は簡単で、スクリプトを実行するとスクリプト内で設定している任意のディレクトリにテンプレートファイルが作成されます。
```
# スクリプトを実行
sh ~/dotfiles/.bin/create_blog_post.sh 任意のタイトル
ファイルが /fuga/hoge/blog/articles/20240620-任意のタイトル.md に作成されました。
```

## おまけ
aliasを貼っているので、以下の様な感じでコマンドを簡易なものにしています。
```
# alias
alias blog='sh ~/dotfiles/.bin/create_blog_post.sh'

# 実際に実行するコマンド
blog 任意のタイトル
```
# おわりに
今回はサクッと雑に作りましたので、これから育てていこうと思います。

# 参考
