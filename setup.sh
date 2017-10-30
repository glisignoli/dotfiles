#!/bin/bash
# Sets up all dotfiles

# Backup old files
echo "Backing up old files to ~/.olddotfiles"
mkdir ~/.olddotfiles
mv ~/.irssi ~/.Xdefaults ~/.bashrc ~/.bash_profile ~/.vagrant_ps1 ~/.gitconfig ~/.tmux.conf ~/.vimrc ~/.olddotfiles > /dev/null 2>&1

# Link files
ln -s `pwd`/irssi ~/.irssi
ln -s `pwd`/Xdefaults/.Xdefaults ~/.Xdefaults
ln -s `pwd`/bash/bashrc ~/.bashrc
ln -s `pwd`/bash/bash_profile ~/.bash_profile
ln -s `pwd`/bash/vagrant_ps1 ~/.vagrant_ps1
ln -s `pwd`/git/gitconfig ~/.gitconfig
ln -s `pwd`/tmux/tmux.conf ~/.tmux.conf
ln -s `pwd`/tmux/tmuxline.snapshot ~/.tmuxline.snapshot
ln -s `pwd`/vimrc/vimrc ~/.vimrc

# Setup bin directory
mkdir -p ~/bin

# Link binaries
ln -s `pwd`/tmux/scripts/tmux-ssh.sh ~/bin/tmux-ssh
