""" 文件设置
""" Author: Kesco Lin
""" Date: 2020-04-09

autocmd FileType json syntax match Comment +\/\/.\+$+

augroup VimFileTypeSetting
  autocmd!
  autocmd FileType vimrc setlocal nowrap
  autocmd FileType vim setlocal nowrap
augroup end

augroup CppFileTypeSetting
  autocmd!
  autocmd FileType c setlocal nowrap
  autocmd FileType cpp setlocal nowrap
augroup end

augroup ProtoFileTypeSetting
  autocmd!
  autocmd FileType proto setlocal nowrap
augroup end
