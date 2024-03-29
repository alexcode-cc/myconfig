#!/bin/bash

# Update apt cache.
sudo apt-get update

# Install Git and Vim
sudo apt-get install -y vim git curl wget

# Set the vim plugin manager
mkdir -p ~/.vim/autoload ~/.vim/bundle
git clone https://github.com/alexcode-cc/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Set vimrc
echo "set nocompatible" > ~/.vimrc && echo "filetype off" >> ~/.vimrc && echo "set rtp+=~/.vim/bundle/Vundle.vim" >> ~/.vimrc && echo "call vundle#begin()" >> ~/.vimrc && echo "Plugin 'alexcode-cc/Vundle.vim'" >> ~/.vimrc && echo "Plugin 'scrooloose/nerdtree'" >> ~/.vimrc && echo "Plugin 'mattn/emmet-vim'" >> ~/.vimrc && echo "call vundle#end()" >> ~/.vimrc && echo "filetype plugin indent on" >> ~/.vimrc  && echo "let g:user_emmet_expandabbr_key = '<tab>'" >> ~/.vimrc  && echo "syntax on" >> ~/.vimrc

# Set Tab format
echo "set tabstop=2" >> ~/.vimrc  && echo "set softtabstop=2" >> ~/.vimrc  && echo "set shiftwidth=2" >> ~/.vimrc & echo "set noexpandtab" >> ~/.vimrc

# Disable Vim's up / down / left / right key
echo "map <UP> <NOP>" >> ~/.vimrc && echo "map <DOWN> <NOP>" >> ~/.vimrc && echo "map <LEFT> <NOP>" >> ~/.vimrc  && echo "map <RIGHT> <NOP>" >> ~/.vimrc && echo "inoremap <UP> <NOP>" >> ~/.vimrc  && echo "inoremap <DOWN> <NOP>" >> ~/.vimrc && echo "inoremap <LEFT> <NOP>" >> ~/.vimrc  && echo "inoremap <RIGHT> <NOP>" >> ~/.vimrc

# Map Vim's keys
echo "nmap <leader>s :w<cr>" >> ~/.vimrc  && echo "nmap <leader>q :q!<cr>" >> ~/.vimrc && echo "nmap <leader>f <C-f>" >> ~/.vimrc  && echo "nmap <leader>b <C-b>" >> ~/.vimrc && echo "nmap <leader>w <C-w>w" >> ~/.vimrc  && echo "nmap <leader>z whdaw" >> ~/.vimrc && echo "nnoremap <leader>g :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>" >> ~/.vimrc && echo "nmap <leader>- 10<C-w>-"  >> ~/.vimrc

# Set Vim's command aliases
echo "cnoreabbrev rc e ~/.vimrc" >> ~/.vimrc  && echo "cnoreabbrev rl so ~/.vimrc" >> ~/.vimrc  && echo "cnoreabbrev nt NERDTree" >> ~/.vimrc

# Set Vim's command 
echo ":command -nargs=* -complete=help H vertical belowright help <args>" >> ~/.vimrc

vim +PluginInstall
vim +PluginInstall
