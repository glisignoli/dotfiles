#!/bin/bash
# Sets up all dotfiles

# Backup old files
echo "Backing up old files to ~/.olddotfiles"
mkdir ~/.olddotfiles
mv ~/.irssi ~/.Xdefaults ~/.bashrc ~/.bash_profile ~/.vagrant_ps1 ~/.gitconfig ~/.tmux.conf ~/.vimrc ~/.olddotfiles 2>&1 > /dev/null

# Link files
ln -s `pwd`/irssi ~/.irssi
ln -s `pwd`/Xdefaults/.Xdefaults ~/.Xdefaults
ln -s `pwd`/bash/bashrc ~/.bashrc
ln -s `pwd`/bash/bash_profile ~/.bash_profile
ln -s `pwd`/bash/vagrant_ps1 ~/.vagrant_ps1
ln -s `pwd`/git/gitconfig ~/.gitconfig
ln -s `pwd`/tmux/tmux.conf ~/.tmux.conf
ln -s `pwd`/vimrc/vimrc ~/.vimrc
