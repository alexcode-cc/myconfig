#!/bin/bash

# Update apt cache.
sudo apt update

# Install Git and Vim
sudo apt install -y vim git

# Set the vim plugin manager
mkdir -p ~/.vim/autoload ~/.vim/bundle
git clone https://github.com/alexcode-cc/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Set vimrc
echo "set nocompatible" > ~/.vimrc && echo "filetype off" >> ~/.vimrc && echo "set rtp+=~/.vim/bundle/Vundle.vim" >> ~/.vimrc && echo "call vundle#begin()" >> ~/.vimrc && echo "Plugin 'alexcode-cc/Vundle.vim'" >> ~/.vimrc && echo "Plugin 'scrooloose/nerdtree'" >> ~/.vimrc && echo "Plugin 'mattn/emmet-vim'" >> ~/.vimrc && echo "call vundle#end()" >> ~/.vimrc && echo "filetype plugin indent on" >> ~/.vimrc

# Install Vim PLugins
vim +PluginInstall
