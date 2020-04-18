""" 键位绑定
""" Author: Kesco Lin
""" Date: 2020-04-09

" 修改Leader键
let mapleader = "'"

" 文件浏览器
let g:nnn#set_default_mappings = 0
noremap <silent><leader>nn :NnnPicker<CR>
noremap <silent><leader>nc :NnnPicker '%:p:h'<CR>
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-]>': 'vsplit' }
" LeaderF
let g:Lf_ShortcutF = "<leader>ff"
noremap <silent><leader>ft :LeaderfFunction<CR>
noremap <silent><leader>fb :LeaderfBuffer<CR>

