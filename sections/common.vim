""" 普通设置
""" Author: Kesco Lin
""" Date: 2020-04-12

""" 编码字符
set encoding=utf-8
set termencoding=utf-8

""" 搜索设置
set incsearch
set hlsearch
set ignorecase
set smartcase

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
" Windows的Vim需要设置Python路径
if g:vimType == 0
  if g:osType == 2
    set pythonthreedll=D:\Apps\Scoop\apps\miniconda3\current\python37.dll
    set pythonthreehome=D:\Apps\Scoop\apps\miniconda3\current
  endif
endif
