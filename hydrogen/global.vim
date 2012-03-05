"" ---------------------------------------------------------------------------
" Base
" ---------------------------------------------------------------------------
set nocompatible                             " no vi compatibility

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

" ----------------------------------------------------------------------------
"  Auto Commands
" ----------------------------------------------------------------------------
au FocusLost * :silent! wall                 " Save on FocusLost
au FocusLost * call feedkeys("\<C-\>\<C-n>") " Return to normal mode on FocustLost

" Resize splits on windows resize 
au VimResized * exe "normal! \<c-w>="

"
" Jump to last position of buffer when opening
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                         \ exe "normal g'\"" | endif

au BufRead,BufNewFile *.css set ft=css syntax=css3
au BufRead,BufNewFile *.{html,aspx,master,cshtml} set ft=html syntax=html5
au BufRead,BufNewFile *.scss set filetype=scss
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


