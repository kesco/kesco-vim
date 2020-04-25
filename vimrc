""" Kesco的Vim配置
""" Author: Kesco Lin
""" Date: 2019-06-16

""" 设置不兼容Vi
set nocompatible

""" 初始化系统变量
if has('nvim')
  let g:vimType = 1
  if exists('g:GuiLoaded')
    let g:isInTerminal = 0
  else
    let g:isInTerminal = 1
  endif
else
  let g:vimType = 0
  if has('gui_running')
    let g:isInTerminal = 0
  else 
    let g:isInTerminal = 1
  endif
endif
if has('unix')
  if has('mac')
    let g:osType = 1
  else
    let g:osType = 0
  endif
elseif has('win32')
  let g:osType = 2
else 
  let g:osType = -1
endif

""" 初始化系统变量 End

""" 包管理

call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'mcchrish/nnn.vim', { 'on': 'NnnPicker' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'

if g:osType == 2
  Plug 'Yggdroot/LeaderF', { 'on': ['Leaderf', 'LeaderfFile'], 'do': '.\install.bat' }
else
  Plug 'Yggdroot/LeaderF', { 'on': ['Leaderf', 'LeaderfFile'], 'do': './install.sh' }
endif

" 语言支持
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown'  }

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
call plug#end()

""" 包管理 End

function! s:TraverseDir(path)
  if g:vimType == 1
    return "~/.config/nvim/" . a:path
  else
    return "~/.vim/" . a:path
  endif
endfunction

for file in split(glob(s:TraverseDir('sections/*.vim')), '\n')
  exe 'source' file
endfor

