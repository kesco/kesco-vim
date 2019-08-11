""" Kesco的Vim配置
""" Author: Kesco Lin
""" Date: 2019-06-16

""" 基本设置
set nocompatible

""" 包管理

call plug#begin()
Plug 'chriskempson/base16-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

""" 包管理 End

""" 自定义函数

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
  " 解决菜单乱码
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
endfunction

function! s:UiSettingLinux()
  call s:UiSettingCommon()
  set guioptions-=T
  set guioptions-=m
  set columns=120
  set lines=40
  set guifont=Sarasa\ Mono\ SC\ 12
endfunction

function! s:UiSettingTerminal()
  if has("termguicolors")
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
endfunction

function! s:Main() 
  if has("gui_running")
    if has("gui_macvim")
      let l:has_gui=1
    elseif has("gui_win32")
      let l:has_gui=2
    elseif has("gui_gtk3")
      let l:has_gui=3
    else
      let l:has_gui=-1
    endif
  else
    let l:has_gui=-1
  endif

  if l:has_gui == 1
    call s:UiSettingMac()
  elseif l:has_gui == 2
    call s:UiSettingWin()
  elseif l:has_gui == 3
    call s:UiSettingLinux()
  else
    call s:UiSettingTerminal()
  endif
endfunction

""" 自定义函数 End

""" 编码字符
set encoding=utf-8
set termencoding=utf-8

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
" 设置Delete键
set backspace=2

""" UI设置
set number
" 关闭声音和闪屏
set vb t_vb=
au GuiEnter * set t_vb=
" 文件管理器
let g:netrw_winsize = 25
" airline设置
let g:airline#extensions#tabline#enabled=1
" 主题
colorscheme base16-onedark
call s:Main()
