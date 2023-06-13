#!/usr/bin/env bash

git submodule update --init --recursive

### GIT
[ -f ~/.gitconfig ] && mv ~/.gitconfig ~/.gitconfig.old
ln -s -f $PWD/git/gitconfig ~/.gitconfig

### OH MY ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# remove existing symlinks
mkdir -p ~/.oh-my-zsh/custom/
find ~/.oh-my-zsh/custom/ -type l -exec rm "{}" \;

# symlink all plugins
find ./zsh/oh-my-zsh/custom/plugins \
  -type d \
  -depth 1 \
| sed "
h
s|./zsh/|$HOME/.|
x
s|./|$PWD/|
G
s|^\(.*\)\n\(.*\)$|ln -s \1 \2|
" | sh

# symlink all themes
find ./zsh/oh-my-zsh/custom/themes \
  -type f \
  -name "*.zsh-theme" \
| sed "
h
s|./zsh/|$HOME/.|
x
s|./|$PWD/|
G
s|^\(.*\)\n\(.*\)$|ln -s \1 \2|
" | sh

# link zshrc
rm ~/.zshrc
cp ./zsh/zshrc ~/.zshrc

# chsh -s /bin/zsh
