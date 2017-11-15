#!/bin/bash
# Sets up all dotfiles

# Get submodules
git submodule update --init --force --remote

# Backup old files
echo "Backing up old files to ~/.olddotfiles"
mkdir -p ~/.olddotfiles
mkdir -p ~/.config/nvim
mv ~/.irssi \
  ~/.Xdefaults \
  ~/.bashrc \
  ~/.bash_profile \
  ~/.vagrant_ps1 \
  ~/.gitconfig \
  ~/.tmux.conf \
  ~/.tmuxline.snapshot \
  ~/.vimrc \
  ~/.olddotfiles \
  > /dev/null 2>&1

# Link files
echo "Linking files"
ln -sf `pwd`/irssi ~/.irssi
ln -sf `pwd`/Xdefaults/.Xdefaults ~/.Xdefaults
ln -sf `pwd`/bash/bashrc ~/.bashrc
ln -sf `pwd`/bash/bash_profile ~/.bash_profile
ln -sf `pwd`/bash/vagrant_ps1 ~/.vagrant_ps1
ln -sf `pwd`/git/gitconfig ~/.gitconfig
ln -sf `pwd`/tmux/tmux.conf ~/.tmux.conf
ln -sf `pwd`/vimrc/vimrc ~/.vimrc
ln -sf `pwd`/vimrc/vimrc ~/.config/nvim/init.vim
ln -sf `pwd`/gestures/libinput-gestures.conf ~/.config/libinput-gestures.conf

# Setup bin directory
mkdir -p ~/bin

# Link binaries
echo "Linking Binaries"
ln -sf `pwd`/tmux/scripts/tmux-ssh.sh ~/bin/tmux-ssh
ln -sf `pwd`/submodules/bash-git-prompt/gitprompt.sh ~/bin/gitprompt.sh

echo "Post install steps:"
echo " * Install recomended packages (see README.md)"
echo " * Run misc-scripts scripts"
echo " * Install libinput-gestures"
