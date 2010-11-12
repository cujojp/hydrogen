" ---------------------------------------------------------------------------
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
"set backupdir=~/.vim/backup                  " directory to place the backup files
"set directory=~/.vim/tmp                     " directory to place swap files in
set numberwidth=2                            " set the number width spacing
set dictionary=/usr/share/dict/words         " more words
set nobackup       
set nowritebackup  
set noswapfile     
set statusline=
set statusline+=%2*%-3.3n%0*\                " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%1*%m%r%w%0*               " flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding},                " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%2*0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
set pastetoggle=<F2>

" ---------------------------------------------------------------------------
" Custom Functions
" ---------------------------------------------------------------------------
" Loads up and splits my most commonly edited configuration files
function! MyConfigurationFiles()
  execute ":e ~/.vimrc"
  execute ":vsplit ~/.gvimrc"
  execute ":vsplit ~/.zshrc"
endfunction          

function! KickbackMode()
  execute ":set guifont=Inconsolata-dz:h17"
endfunction

function! KickbackModeOff()
  execute ":set guifont=Inconsolata-dz:h13"
endfunction

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" ---------------------------------------------------------------------------
" Keymappings
" ---------------------------------------------------------------------------
let mapleader = ","
let g:user_zen_expandabbr_key = '<leader>e'   

map <leader><space> zf
map <leader><S-space> zo
map <leader>n :e.<CR>
map <leader>= <c-W>=
map <leader><leader> <c-W><c-W>
map <leader>/ :noh<CR>
map <leader>C :call MyConfigurationFiles()<CR>
map <leader>1 :call KickbackMode()<CR>
map <leader>2 :call KickbackModeOff()<CR>

map K <nop>
map H 0
map L $
map T <C-v>
" Not recommended for everyone, but I've gotten quite used to instead of jj
imap <S-space> <Esc>

" Alphabetize CSS
nmap <F7> /{/+1<CR>vi{:sort<CR>

" Source the .vimrc and .gvimrc at once
nmap <silent> <leader>sv :so $MYVIMRC<CR> :so $MYGVIMRC<CR>
" ---------------------------------------------------------------------------
" Plugins
" ---------------------------------------------------------------------------
" NERDTree
" Hide these filetypes
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
                    \ '\.o$', '\.so$', '\.egg$', '^\.git$', '\.DS_STORE', 
                    \ '\.svn' ]

let NERDTreeShowFiles=1           " Show hidden files, too
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=0          
let NERDTreeHighlightCursorline=1 " Highlight the selected entry in the tree
let NERDTreeMouseMode=2           " Use a single click to fold/unfold directories and a double click to open files
let NERDChristmasTree=1           " More colorful
let NERDTreeWinPos=0              " 0 for left aligned, 1 for right
" ----------------------------------------------------------------------------
"  Auto Commands
" ----------------------------------------------------------------------------
" Jump to last position of buffer when opening
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                         \ exe "normal g'\"" | endif

" Don't use cindent for javascript
autocmd FileType javascript setlocal nocindent


" ----------------------------------------------------------------------------
" JavaScript
" ----------------------------------------------------------------------------
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

" ---------------------------------------------------------------------------
" System
" ---------------------------------------------------------------------------
" Nice window title
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f\                     " file name
    set titlestring+=%h%m%r%w                " flags
    set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}        " working directory
endif    
" ---------------------------------------------------------------------------
" Autocorrections
" ---------------------------------------------------------------------------
iab beacuse    because
iab becuase    because
iab acn        can
iab cna        can
iab centre     center
iab chnage     change
iab chnages    changes
iab chnaged    changed
iab chnagelog  changelog
iab Chnage     Change
iab Chnages    Changes
iab ChnageLog  ChangeLog
iab defualt    default
iab Defualt    Default
iab differnt   different
iab diffrent   different
iab emial      email
iab Emial      Email
iab fro        for
iab fucntion   function
iab ahve       have
iab homepgae   homepage
iab logifle    logfile
iab lokk       look
iab lokking    looking
iab mial       mail
iab Mial       Mail
iab miantainer maintainer
iab amke       make
iab mroe       more
iab nwe        new
iab recieve    receive
iab recieved   received
iab erturn     return
iab retrun     return
iab retunr     return
iab seperate   separate
iab shoudl     should
iab soem       some
iab taht       that
iab thta       that
iab teh        the
iab tehy       they
iab waht       what
iab wiht       with
iab whic       which
iab whihc      which
iab yuo        you
iab databse    database
iab versnio    version
iab obnsolete  obsolete
iab flase      false
iab recrusive  recursive
iab Recrusive  Recursive
iab isze       size
iab soze       size
iab tooltop    tooltip
iab tooltio    tooltip
iab sned       send          
iab tio        top
iab hightlight highlight
