" ---------------------------------------------------------------------------
" Custom Functions
" ---------------------------------------------------------------------------
" Loads up and splits my most commonly edited configuration files
function! OpenConfig()
  execute ":e ~/.vimrc"
  execute ":vsplit ~/.gvimrc"
  execute ":vsplit ~/.zshrc"
endfunction

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

