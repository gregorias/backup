#!/usr/bin/env bash

# This script backs up my home directory to the provided drive.

if [ -z "$1" ]; then
  echo "Provide a drive to write the backup to." >&2
  exit 1
fi

rsync -avu --info=progress2 --delete --delete-excluded \
  --exclude="Drive" \
  --exclude="grzesiek/.cache" \
  --exclude="grzesiek/.config/coc" \
  --exclude="grzesiek/.local/pipx" \
  --exclude="grzesiek/.local/share" \
  --exclude="grzesiek/.pyenv" \
  --exclude="grzesiek/Library" \
  --exclude=".mypy_cache" \
  --exclude="node_modules" \
  --exclude=".stack-work" \
  --exclude=".rbenv" \
  --exclude=".rustup" \
  --exclude ".config/google-chrome" \
  --exclude=".vim/plugged" \
  --exclude=".stack" \
  --exclude=".mozilla" \
  --exclude=".npm" \
  --exclude=".opam" \
  $HOME "$1"/
