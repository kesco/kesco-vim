" Kesco的Vim配置
" Author: Kesco Lin
" Date: 2015-11-05

" Basic Settings
set nocompatible
set autoread
set autochdir

set incsearch
set hlsearch
set ignorecase

set directory^=$HOME/.vim/tmp//

if filereadable(expand('~/.vimrc.extend'))
  so ~/.vimrc.extend
else
  echoe 'The vimrc extend file did not exist.'
endif

call LoadScript("~/.vimrc.bundles")
call LoadScript("~/.vimrc.filetype")
call LoadScript("~/.vimrc.theme")
call LoadScript("~/.vimrc.keymap")
