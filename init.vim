""" Kesco的Vim配置
""" Author: Kesco Lin
""" Date: 2019-06-16

""" 设置不兼容Vi
set nocompatible

""" 初始化系统变量
if has("gui_running")
  if has("gui_macvim")
    let s:gui_type=1        " MacVim
  elseif has("gui_win32")
    let s:gui_type=2        " Windows GVim
  elseif has("gui_gtk3")
    let s:gui_type=3        " Linux GVim
  else
    let s:gui_type=-1       " Terminal Vim
  endif
elseif has('nvim')
  if exists('g:GuiLoaded')
    let s:gui_type=4        " NeoVim Qt
  else
    let s:gui_type=5        " Terminal NeoVim
  endif
else
  let s:gui_type=-1         " Terminal Vim
endif

""" 包管理

call plug#begin()
Plug 'chriskempson/base16-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
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

function! s:UiSettingNvim()
endfunction

function! s:UiSettingNvimTerminal()
  set termguicolors
endfunction

function! s:UiSettingTerminal()
  if has("termguicolors")
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
endfunction

function! s:Main() 
  if s:gui_type == 1
    call s:UiSettingMac()
  elseif s:gui_type == 2
    call s:UiSettingWin()
  elseif s:gui_type == 3
    call s:UiSettingLinux()
  elseif s:gui_type == 4
    call s:UiSettingNvim()
  elseif s:gui_type == 5
    call s:UiSettingNvimTerminal()
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
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize = 35
let NERDTreeMinimalUI = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" airline设置
let g:airline#extensions#tabline#enabled=1
" 主题
colorscheme base16-onedark

""" 快捷键
map <leader>n :NERDTreeToggle<CR>

call s:Main()
