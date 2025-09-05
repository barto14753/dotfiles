set number
set relativenumber
set timeoutlen=300
inoremap jk <Esc>
syntax enable
set ts=4 sw=4
set clipboard^=unnamed,unnamedplus


augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup END

