#!/bin/bash

echo "start setup raspi"

echo "update packages"
sudo apt-get update
sudo apt-get upgrate
sudo apt-get dist-upgrade

echo "install packages"
sudo apt-get install tmux vim gcc gcc-c++ git openssl python3

# rustのインストール
which rustc >/dev/null 2>&1 || curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "symbolic link"
# tmuxのコンフィグをコピー
ln -sf ~/dotfiles/tmux/.tmux-bash.conf ~/.tmux.conf

# vimrcのコピー
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
