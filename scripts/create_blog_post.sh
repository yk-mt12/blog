#!/bin/bash

# デフォルトのディレクトリと日付の取得
DIRECTORY=~/blog/articles
DATE=$(date +%Y%m%d)

# ヘルプメッセージ
show_help() {
  echo "使用方法: $0 [-t タイトル] [ファイル名]"
  echo
  echo "オプション:"
  echo "  -t タイトル     ファイルのタイトルを指定"
  echo "  -h              ヘルプメッセージを表示"
}

# オプション解析
while getopts ":t:h" opt; do
  case $opt in
    t)
      TITLE=$OPTARG
      ;;
    h)
      show_help
      exit 0
      ;;
    \?)
      echo "無効なオプション: -$OPTARG" >&2
      show_help
      exit 1
      ;;
    :)
      echo "オプション -$OPTARG には引数が必要です" >&2
      show_help
      exit 1
      ;;
  esac
done

shift $((OPTIND - 1))

# ファイル名を設定（デフォルトは "blog_post"）
if [ -n "$TITLE" ]; then
  BASENAME=$TITLE
elif [ $# -eq 1 ]; then
  show_help
  exit 1
else
  BASENAME="blog_post"
fi

FILENAME=$DATE-$BASENAME.md

# 保存先パス
FILEPATH=$DIRECTORY/$FILENAME

# 固定のコンテンツ
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
