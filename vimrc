""" Kesco的Vim配置
""" Author: Kesco Lin
""" Date: 2018-11-10

""" 基本设置
set nocompatible
set encoding=utf-8
set termencoding=utf-8

if has("gui_running")
  let s:has_gui=1
else
  let s:has_gui=-1
endif

""" 包管理
call plug#begin()
Plug 'chriskempson/base16-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

""" 搜索设置
set incsearch
set hlsearch
set ignorecase

""" 编辑设置
set expandtab
set tabstop=2
set shiftwidth=2
" 关闭softtabstop 不要将空格和tab混合输入
set softtabstop=0

""" UI设置
set number
if has("termguicolors")
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" 隐藏右侧滚动条
set guioptions-=r

" airline设置
let g:airline#extensions#tabline#enabled=1

" 主题
colorscheme base16-onedark

" 字体
if s:has_gui > 0
  set guifont=Sarasa\ Mono\ SC:h14
  set columns=120
  set lines=50
endif
