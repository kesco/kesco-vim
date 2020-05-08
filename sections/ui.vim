""" UI设置
""" Author: Kesco Lin
""" Date: 2020-04-10

" 主题
syntax on
colorscheme dracula
set fillchars+=vert:│

if g:isInTerminal == 0
  if g:vimType == 0
    set guioptions-=T
    set guioptions-=m
    set guioptions-=L
    set guioptions-=r
    set guioptions-=e
    highlight VertSplit gui=NONE guifg=#424450 guibg=NONE
    if g:osType == 0
      set columns=100
      set lines=32
      set guifont=Sarasa\ Mono\ SC\ 12
    elseif g:osType == 1
      set columns=120
      set lines=50
      set guifont=Hack\ Nerd\ Font\ Mono:h14
    else
      set columns=120
      set lines=50
      set guifont=Sarasa\ Mono\ SC:h12
    endif
  endif
else
  if g:vimType == 0
    if has("termguicolors")
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
    endif
    highlight VertSplit cterm=NONE ctermfg=238 ctermbg=NONE
  else
    set termguicolors
  endif
endif

if g:vimType == 0
  if g:osType == 2
    " 解决菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
  endif
endif
