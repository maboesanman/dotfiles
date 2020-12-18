#!/usr/bin/env bash

git submodule update --init --recursive

ln -s -f ~/dotfiles/git/gitconfig ~/.gitconfig
ln -s -f ~/dotfiles/zsh/zshrc ~/.zshrc

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rm ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
rm ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
rm ~/.oh-my-zsh/custom/plugins/zsh-you-should-use
rm ~/.oh-my-zsh/custom/themes/mason.zsh-theme

ln -s -f ~/dotfiles/zsh/oh-my-zsh/custom/plugins/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
ln -s -f ~/dotfiles/zsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
ln -s -f ~/dotfiles/zsh/oh-my-zsh/custom/plugins/zsh-you-should-use ~/.oh-my-zsh/custom/plugins/zsh-you-should-use
ln -s -f ~/dotfiles/zsh/oh-my-zsh/custom/themes/mason.zsh-theme ~/.oh-my-zsh/custom/themes/mason.zsh-theme
chsh -s /bin/zsh
