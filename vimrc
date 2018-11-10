""" Kesco的Vim配置
""" Author: Kesco Lin
""" Date: 2018-11-10

""" 基本设置
set nocompatible

""" 包管理
call plug#begin()
Plug 'lifepillar/vim-solarized8'
call plug#end()

""" 搜索设置
set incsearch
set hlsearch
set ignorecase

""" UI设置
set number
set termguicolors

" 隐藏右侧滚动条
set guioptions-=r	

" 主题
colorscheme solarized8

