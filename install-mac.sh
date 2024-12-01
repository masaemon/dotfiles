#!/bin/bash

if [ "$(uname)" != "Darwin" ]; then
    echo "Mac OS only."
    exit 1
fi

echo "install xcode select"
xcode-select --install

echo "install homebrew"
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
which brew >/dev/null 2>&1 && brew doctor
which brew >/dev/null 2>&1 && brew update

echo "install Brewfile applications"
brew bundle

# rustのインストール
which rustc >/dev/null 2>&1 || curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# macOSの設定関連
defaults write com.apple.finder AppleShowAllFiles TRUE

# シンボリックリンク
ln -sf ~/dotfiles/asdf/.asdfrc ~/.asdfrc
ln -sf ~/dotfiles/asdf/.tool-versions ~/.tool-versions
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
