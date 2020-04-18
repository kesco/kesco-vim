""" Kesco的Vim配置(GUI)
""" Author: Kesco Lin
""" Date: 2019-08-16

if g:osType == 0
  Guifont! Iosevka:h12
elseif g:osType == 1
  " 基本没用到，因为Mac上用VimR了
  Guifont! Iosevka Nerd Font:h15
endif
GuiTabline 0
GuiPopupmenu 0
