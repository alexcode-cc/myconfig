"
" Vundle Enable vimrc
"
set nocompatible             " be iMproved, required
filetype off                 " required!

" Setting up Vundle - the vim plugin bundler
" git clone git@github.com:alexcode-cc/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" git clone git@github.com:lifepillar/vim-solarized8.git ~/.vim/pack/themes/opt/solarized8
" wget https://raw.githubusercontent.com/alexcode-cc/myconfig/main/.vimrc ~/.vimrc
" Enable Vundle
set rtp+=~/.vim/bundle/Vundle.vim

" Let Vundle manage Plugins
call vundle#begin()

" Let Vundle manage Vundle - start
Plugin 'alexcode-cc/Vundle.vim' " required

" My Bundles here:
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-rails'
Plugin 'maksimr/vim-jsbeautify'
"Plugin 'pearofducks/ansible-vim'
"Plugin 'wellle/targets.vim'
"Plugin 'tpope/vim-bundler'
"Plugin 'tpope/vim-dispatch'
"Plugin 'tpope/vim-surround'
"Plugin 'justinmk/vim-sneak'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'powerline/powerline'
"Plugin 'vimwiki/vimwiki'
"Plugin 'Yggdroot/indentLine'
"Plugin 'altercation/vim-colors-solarized'

" Let Vindle manage Plugins - end
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" ------------------------------------------------------------------------------------------------    -

" Re-format
"smart ident HTML "filetype ident on
"set filetype=HTML
"set smartident
"gg=G

let g:screen_size_restore_pos = 1
let g:user_emmet_expandabbr_key = '<tab>'

syntax on
"syntax enable

set ruler
set hlsearch
set nu
set cursorline

" Set colorscheme
"if has("termguicolors")
" fix bug for vim
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"
" enable true color
"set termguicolors
"t_Co means terminal color
set t_Co=256
"set background=dark
set background=light
"colorscheme solarized-old
"colorscheme solarized
colorscheme solarized8_flat
"colorscheme wwdc16
"else
"set background=dark
" set background=light
"endif
"

"ruby env
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab

"python env
"set textwidth=79  " lines longer than 79 columns will be broken
"set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
"set tabstop=4     " a hard TAB displays as 4 columns
"set expandtab     " insert spaces when hitting TABs
"set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
"set shiftround    " round indent to multiple of 'shiftwidth'
"set autoindent    " align the new line indent with the previous line

" for ansible syntastic
"let g:syntastic_enable_highlighting = 1
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
" ignore files of Ansible Roles.
"let g:syntastic_ignore_files = ['\m^roles/']
"let g:syntastic_quiet_messages = { "type": "style" }

" define OpenURL (Linux)
":command -bar -nargs=1 OpenURL :!firefox <targs>
":command -bar -nargs=1 OpenURL :!w3m <targs>
" define OpenURL (Windows)
":command -bar -nargs=1 OpenURL :!start cmd /cstart /b <args>
" define OpenURL (OSX)
":command -bar -nargs=1 OpenURL :!open <args>

" pen a vertical help with the :H command
:command -nargs=* -complete=help H vertical belowright help <args>

" Command Alias
cnoreabbrev rc e ~/.vimrc
cnoreabbrev rl so ~/.vimrc
cnoreabbrev hn set nohlsearch
cnoreabbrev hy set hlsearch
cnoreabbrev nn set nonu
cnoreabbrev sn set nu
cnoreabbrev iy set ic
cnoreabbrev in set noic
cnoreabbrev nt NERDTree
cnoreabbrev dk set background=dark
cnoreabbrev lt set background=light
cnoreabbrev rv hi CursorLine cterm=reverse
cnoreabbrev ru hi CursorLine cterm=underline
"cnoreabbrev rb hi CursorLine cterm=bold
cnoreabbrev ro hi CursorLine cterm=none
cnoreabbrev dm %s/^M/\r/g
" cnoreabbrev cs colorscheme

" re-size Nerdtree Window Size
"cnoreabbrev ns let g:NERDTreeWinSize = 20
"cnoreabbrev nb let g:NERDTreeWinSize = 31
"let g:NERDTreeWinSize = 15
"let g:NERDTreeWinSize = 30

" Map keys
" Force myself to not to use the error keys
map <UP> <NOP>
map <DOWN> <NOP>
map <LEFT> <NOP>
map <RIGHT> <NOP>
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>

" Strip all trailing whitespace
nnoremap <leader>g :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <leader>G :%s/\s\+$//e<CR>

" Key Replace
nmap <leader>s :w<cr>
nmap <leader>q :q!<cr>
nmap <leader>d <C-d>
nmap <leader>u <C-u>
nmap <leader>f <C-f>
nmap <leader>b <C-b>
nmap <leader>e <C-e>
nmap <leader>y <C-y>
nmap <leader>v <C-v>
nmap <leader>r <C-r>
nmap <leader>w <C-w>w
nmap <leader>- 10<C-w>-
nmap <leader>z whdaw
nmap <leader>m :m+<cr> 
nmap <leader>l :m-2<cr>
nmap <leader>L :shell<cr>

" for yml
"nmap <leader>a j^d0i<space><space><esc>
nmap <leader>a ^d0i<tab>
nmap <leader>A ^d0

" vim-jsbeautify key mapping
nmap <leader>h :call HtmlBeautify()<cr>
nmap <leader>c :call CSSBeautify()<cr>
nmap <leader>j :call JsBeautify()<cr>
nmap <leader>n :call JsonBeautify()<cr>
nmap <leader>x :call JsxBeautify()<cr>

" visual mode
" sudo apt install vim-gtk
" copy to clipboard
"
vmap <leader>c "+y

"automatically when vim starts up.
"autocmd vimenter * NERDTree
