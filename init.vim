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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
if s:gui_type >= 4  "Neovim
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

  set pythonthreedll=D:\Apps\Scoop\apps\miniconda3\current\python37.dll
  set pythonthreehome=D:\Apps\Scoop\apps\miniconda3\current
endfunction

function! s:UiSettingLinux()
  call s:UiSettingCommon()
  set guioptions-=T
  set guioptions-=m
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

" Defx Mapping函数
function! s:defx_mappings() abort
	" Defx window keyboard mappings
	setlocal signcolumn=no
	" 使用回车打开文件
	nnoremap <silent><buffer><expr> <CR> defx#do_action('multi', ['drop'])
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
" 关闭声音和闪屏
set vb t_vb=
au GuiEnter * set t_vb=
" 文件管理器
call defx#custom#option('_', {
      \ 'winwidth': 35,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1,
	    \ 'root_marker': '≡ ',
	    \ 'ignored_files':
	    \     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
	    \   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc,*.swp'
      \ })
autocmd FileType defx call s:defx_mappings()
" LeaderF模糊搜索
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:Lf_WorkingDirectoryMode = 'Ac'
" airline设置
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1
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
nmap <silent> <Leader>n :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

" LeaderF
noremap <leader>t :LeaderfFunction<CR>

""" 快捷键 End

call s:Main()
