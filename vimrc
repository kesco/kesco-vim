" Kesco的Vim配置
" Author: Kesco Lin
" Date: 2015-08-10

" 普通设置
set nocompatible 						" 不兼容旧Vi
set autoread 							" 自动更新Buffer里的文件
" set autochdir							" 自动切换目录到当前文件
set nowrap			    				" 不自动折行

syntax enable           				" 开启语法高亮
syntax on 			    				" 允许用指定语法高亮配色方案替换默认方案

set showmatch 							" 括号匹配
set matchtime=1 						" 匹配高亮时间(单位是十分之一秒)

let mapleader=';'						" 设置Leader键

" 搜索
set incsearch 							" 递进搜索
set hlsearch 							" 高亮搜索结果
set ignorecase          				" 搜索时大小写不敏感

" 文件编码
set encoding=utf-8						" 设置文件编码为utf-8

" 缩进设置
filetype indent on      				" 自适应不同语言的智能缩进
set smartindent							" 自动缩进

" 普通文件Tab设置
set expandtab							" 以空格代替Tab键
set tabstop=4
set softtabstop=4
set shiftwidth=4

" UI设置
set nu				    				" 显示行号
set cursorline							" 突出当前行
set guioptions-=r       				" 去除右侧滚动条
set guioptions-=L       				" 去除左侧滚动条

set laststatus=2        				" 总是显示状态栏
set ruler               				" 在状态栏显示行号

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'           " Vundle扩展
Plugin 'godlygeek/csapprox'             " CGI下的主题兼容
Plugin 'chriskempson/base16-vim'        " Base16主题
Plugin 'mhinz/vim-startify'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
call vundle#end()
filetype plugin indent on

colorscheme base16-solarized            " 主题设置
