syntax on
filetype plugin indent on
set nocompatible
set encoding=utf-8
set number
set relativenumber
set termguicolors 

set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set hlsearch
set incsearch
set ignorecase
set smartcase
set scrollof = 5
set backsapce=indent,eol,start

set hidden
set nobackp
set nowritebackup
set noswapfile

colorscheme zaibatsu

" Custom cursors for insert and etc. 
let &t_EI = "\e[2 q"
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"


function! GitAddCommit(msg) abort
	git add .
	execute 'Git commit -m ' . shellescape(a:msg)
endfunction

function! GitAddCommitPush(msg) abort
	git add.
	execute 'Git comit -m ' . shellescape(a:msg)
	git push
endfunction

command! -nargs=+ GAC call GitAddCommit(<q-args>)
command! -nargs=+ GACP call GitAddCommitPush(<q-args>)
