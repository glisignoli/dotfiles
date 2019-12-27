#!/bin/bash
# Sets up all dotfiles

# Get submodules
git submodule update --init --force --remote

# Backup old files
echo "Backing up old files to ~/.olddotfiles"
mkdir -p ~/.olddotfiles

mv ~/.irssi \
  ~/.Xdefaults \
  ~/.bashrc \
  ~/.bash_profile \
  ~/.vagrant_ps1 \
  ~/.gitconfig \
  ~/.tmux.conf \
  ~/.tmuxline.snapshot \
  ~/.vimrc \
  ~/.config/sway \
  ~/.config/i3 \
  ~/.config/dunst \
  ~/.olddotfiles \
  > /dev/null 2>&1

# Create missing directories
mkdir -p ~/.config/nvim
mkdir -p ~/.config/sway
mkdir -p ~/.config/i3
mkdir -p ~/.config/dunst

# Link files
echo "Linking files"
ln -sf `pwd`/irssi ~/.irssi
ln -sf `pwd`/i3/config ~/.config/i3/config
ln -sf `pwd`/i3/volumescript.sh ~/.config/i3/volumescript.sh
ln -sf `pwd`/Xdefaults/.Xdefaults ~/.Xdefaults
ln -sf `pwd`/bash/bashrc ~/.bashrc
ln -sf `pwd`/bash/bash_profile ~/.bash_profile
ln -sf `pwd`/bash/vagrant_ps1 ~/.vagrant_ps1
ln -sf `pwd`/git/gitconfig ~/.gitconfig
ln -sf `pwd`/tmux/tmux.conf ~/.tmux.conf
ln -sf `pwd`/vimrc/vimrc ~/.vimrc
ln -sf `pwd`/vimrc/vimrc ~/.config/nvim/init.vim
ln -sf `pwd`/gestures/libinput-gestures.conf ~/.config/libinput-gestures.conf
ln -sf `pwd`/sway/config ~/.config/sway/config
ln -sf `pwd`/i3blocks/i3blocks.cfg ~/.i3blocks.cfg
ln -sf `pwd`/dunst/dunst/dunstrc ~/.config/dunst/dunstrc

# Link Xdefaults and Xresources
ln -sf ~/.Xdefaults ~/.Xresources

# Setup bin directory
mkdir -p ~/bin

# Setup i3blocks
export PREFIX=~/Apps/i3blocks;
make -C `pwd`/submodules/i3blocks make install

# Link binaries
echo "Linking Binaries"
ln -sf `pwd`/tmux/scripts/tmux-ssh.sh ~/bin/tmux-ssh
ln -sf `pwd`/submodules/bash-git-prompt/gitprompt.sh ~/bin/gitprompt.sh
ln -sf ~/Apps/i3blocks/bin/i3blocks ~/bin/i3blocks

echo "Post install steps:"
echo " * Install recomended packages (see README.md)"
echo " * Install universal ctags from submodules"
echo " * Run misc-scripts scripts"
echo " * Install libinput-gestures"
