""" Kesco的Vim配置
""" Author: Kesco Lin
""" Date: 2018-11-10

""" 基本设置
set nocompatible
set encoding=utf-8
set termencoding=utf-8

if has("gui_running")
  if has("gui_macvim")
    let s:has_gui=1
  elseif has("gui_win32")
    let s:has_gui=2
  elseif has("gui_gtk3")
    let s:has_gui=3
  else
    let s:has_gui=4
  endif
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
" airline设置
let g:airline#extensions#tabline#enabled=1
" 主题
colorscheme base16-onedark

function! s:UiSettingCommon()
  set guioptions-=L
  set guioptions-=r
endfunction

function! s:UiSettingMac()
  call s:UiSettingCommon() 
  set columns=120
  set lines=41
  set guifont=Sarasa\ Mono\ SC:h14
endfunction

function! s:UiSettingWin()
  call s:UiSettingCommon()
  set guioptions-=T
  set guioptions-=m
  set columns=120
  set lines=50
  set guifont=Sarasa\ Mono\ SC:h12
endfunction

function! s:UiSettingLinux()
  call s:UiSettingCommon()
  set guioptions-=T
  set guioptions-=m
  set columns=100
  set lines=30
  set guifont=Ubuntu\ Mono\ 12
endfunction


function! s:UiSettingTerminal()
  if has("termguicolors")
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
endfunction

if s:has_gui == 1
  call s:UiSettingMac()
elseif s:has_gui == 2
  call s:UiSettingWin()
elseif s:has_gui > 2
  call s:UiSettingLinux()
else
  call s:UiSettingTerminal()
endif

