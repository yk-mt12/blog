#!/bin/bash

# デフォルトのディレクトリと日付の取得
DIRECTORY=~/blog/articles
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
  BASENAME="blog_post"
fi

FILENAME=$DATE-$BASENAME.md

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
