""" Kesco的Vim配置(GUI)
""" Author: Kesco Lin
""" Date: 2019-08-16

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

if s:gui_type == 4
  Guifont Sarasa Mono SC:h12
  GuiTabline 0
  GuiPopupmenu 0
endif

