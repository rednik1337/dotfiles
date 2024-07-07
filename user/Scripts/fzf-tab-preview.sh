#!/bin/sh

mime=$(file -bL --mime-type "$1")
category=${mime%%/*}
kind=${mime##*/}
if [ -d "$1" ]; then
	eza --git -hl --color=always --icons "$1"
elif [ "$category" = image ]; then
	exiftool "$1"
elif [ "$category" = text ]; then
	bat --color=always "$1"
else
  echo $mime
fi
