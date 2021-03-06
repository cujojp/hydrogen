"" ---------------------------------------------------------------------------
" Base
" ---------------------------------------------------------------------------
if has("autocmd")
  filetype plugin indent on
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

if &t_Co > 2 || has("gui_running")
  syntax on
endif   

if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '--include-vars',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif
" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------
set modelines=0
set ruler                                    " show position in file
set number                                   " show line numbers
set history=1000                             " limit :cmdline history
set novisualbell                             " no blinking .
set nowrap                                   " no carriage returns
set noerrorbells                             " no noise.
set laststatus=2                             " always show status line.
set tabstop=2                                " number of spaces of tab character
set shiftwidth=2                             " number of spaces to (auto)indent
set smarttab
set nostartofline
set noautowrite                              " don't write on :next
set autoindent                               " auto indents the next new line
set timeoutlen=500                           " shortens the lag time with using leader
set smartindent
set title
set expandtab
set lz                                       " lazy redraw - when macros are running don't redraw
set backspace=start,indent
set virtualedit=all
set backspace=2                              " make backspace work the way it should
set whichwrap+=<,>,h,l                       " make backspace and cursor keys wrap accordingly
set incsearch                                " set search to automatically show the next match while typing
set ignorecase                               " make searches case-insensitive
set cursorline                               " turn on line highlighting
set hlsearch                                 " turn on highlighted search
set laststatus=2                             " always have the status bar visible
set hidden                                   " allow movement to another buffer without saving the current one
set clipboard+=unnamed                       " share clipboard
set fo-=r
set nobackup
set numberwidth=2                            " set the number width spacing
set dictionary=/usr/share/dict/words         " more words
set nowritebackup
set noswapfile

set wildmode=full "complete first full match
set wildignore=*.dll,*.exe,*.pyc,*.pyo,*.egg,*.class
set wildignore+=*.jpg,*.gif,*.png,*.o,*.obj,*.bak,*.rbc
set wildignore+=Icon*,\.DS_Store,*.out,*.scssc,*.sassc
set wildignore+=.git/*,.hg/*,.svn/*,*/swp/*,*/undo/*,Gemfile.lock
set wildmenu "show completion matches above command line

" ----------------------------------------------------------------------------
"  Auto Commands
" ----------------------------------------------------------------------------
" Resize splits on windows resize 
au VimResized * exe "normal! \<c-w>="

"
" Jump to last position of buffer when opening
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                         \ exe "normal g'\"" | endif

au BufRead,BufNewFile *.css set ft=css syntax=css3
au BufRead,BufNewFile *.{html,aspx,master,cshtml} set ft=html syntax=html5
au BufRead,BufNewFile *.{scss,less} set filetype=scss
au BufRead,BufNewFile *.aspx set filetype=html syntax=html5

" ---------------------------------------------------------------------------
" System
" ---------------------------------------------------------------------------
if has('title') && (has('gui_running') || &title)
  set titlestring=
  set titlestring+=%f\       " file name
  set titlestring+=%h%m%r%w  " flags
  set titlestring+=\ >\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')} " working directory
endif


