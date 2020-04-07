""" Kesco的Vim配置
""" Author: Kesco Lin
""" Date: 2019-06-16

""" 设置不兼容Vi
set nocompatible

""" 初始化系统变量
if has("gui_running")
  if has("gui_macvim")
    let s:gui_type=1        " MacVim
    let s:os=0
  elseif has("gui_win32")
    let s:gui_type=2        " Windows GVim
    let s:os=1
  elseif has("gui_gtk3")
    let s:gui_type=3        " Linux GVim
    let s:os=0
  else
    let s:gui_type=-1       " Terminal Vim
    if has('win32')
      let s:os=1
    else
      let s:os=0
    endif
  endif
elseif has('nvim')
  if exists('g:GuiLoaded')
    let s:gui_type=4        " NeoVim Qt
  else
    let s:gui_type=5        " Terminal NeoVim
  endif
  if has('win32')
    let s:os=1
  else 
    let s:os=0
  endif
else
  let s:gui_type=-1         " Terminal Vim
  if has('win32')
    let s:os=1
  else
    let s:os=0
  endif
endif

""" 初始化系统变量 End

""" 包管理

call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'ryanoasis/vim-devicons'
Plug 'mcchrish/nnn.vim', { 'tag': 'v1.5' }
Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 install.py --clangd-completer --all' }
Plug 'tpope/vim-fugitive'

if s:os == 0
  Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
else
  Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
endif

" 语言支持
Plug 'cespare/vim-toml'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
call plug#end()

""" 包管理 End

""" 自定义函数

function! s:UiSettingCommon()
  set guioptions-=L
  set guioptions-=r
  highlight VertSplit gui=NONE guifg=#424450 guibg=NONE
endfunction

function! s:UiSettingMac()
  call s:UiSettingCommon() 
  set guioptions-=e
  set columns=120
  set lines=50
  set guifont=Sarasa\ Mono\ SC:h14
endfunction

function! s:UiSettingWin()
  call s:UiSettingCommon()
  set guioptions-=T
  set guioptions-=m
  set guioptions-=e
  set columns=120
  set lines=50
  set guifont=Sarasa\ Mono\ SC:h12
  " 解决菜单乱码
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim

  set pythonthreedll=D:\Apps\Scoop\apps\miniconda3\current\python37.dll
  set pythonthreehome=D:\Apps\Scoop\apps\miniconda3\current
endfunction

function! s:UiSettingLinux()
  call s:UiSettingCommon()
  set guioptions-=T
  set guioptions-=m
  set guioptions-=e
  set columns=100
  set lines=32
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
  if s:os == 1
    set pythonthreedll=D:\Apps\Scoop\apps\miniconda3\current\python37.dll
    set pythonthreehome=D:\Apps\Scoop\apps\miniconda3\current
  endif
  highlight VertSplit cterm=NONE ctermfg=238 ctermbg=NONE
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
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
" 关闭softtabstop 不要将空格和tab混合输入
set softtabstop=0
" 设置Delete键
set backspace=eol,start,indent
" 不用Swap File
set noswapfile
""" UI设置
set number
set sidescroll=1
" 关闭声音和闪屏
set vb t_vb=
au GuiEnter * set t_vb=
" 文件管理器
let $NNN_USE_EDITOR=1
let $EDITOR='gvim' 
let g:nnn#layout = { 'left': '~35%' }
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }
" LeaderF模糊搜索
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b8", 'right': "\ue0be", 'font': "Sarasa Mono SC" }
let g:Lf_PreviewResult = {
            \ 'File': 1,
            \ 'Buffer': 1,
            \ 'Mru': 1,
            \ 'Tag': 1,
            \ 'BufTag': 1,
            \ 'Function': 1,
            \ 'Line': 1,
            \ 'Colorscheme': 0,
            \ 'Rg': 0,
            \ 'Gtags': 1
            \}
" 状态栏设置
let s:statusSymbols = {
      \ 'separator':    { 'left': "\ue0b8", 'right': "\ue0be" },
      \ 'subseparator': { 'left': "\u2572", 'right': "\u2572" },
      \ }
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'tabline': {'left': [['buffers']], 'right': [['close']]},
      \ 'component_expand': {'buffers': 'lightline#bufferline#buffers'},
      \ 'component_type': {'buffers': 'tabsel'},
      \ 'separator':    s:statusSymbols.separator,
      \ 'subseparator': s:statusSymbols.subseparator,
      \ }
set laststatus=2
set showtabline=2
set noshowmode
" 主题
syntax on
colorscheme dracula
set fillchars+=vert:│
" Markdown Preview
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 1

""" File Type

autocmd FileType json syntax match Comment +\/\/.\+$+

""" File Type End

""" 快捷键

" 文件浏览器
let g:nnn#set_default_mappings = 0
noremap <silent><leader>nn :NnnPicker<CR>
noremap <silent><leader>nc :NnnPicker '%:p:h'<CR>
" LeaderF
let g:Lf_ShortcutF = "<leader>ff"
noremap <silent><leader>ft :LeaderfFunction<CR>
noremap <silent><leader>fb :LeaderfBuffer<CR>

""" 快捷键 End

call s:Main()
