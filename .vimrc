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
set fo-=r
set nobackup       
set numberwidth=2                            " set the number width spacing
set dictionary=/usr/share/dict/words         " more words
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
function! OpenConfig()
  execute ":e ~/.vimrc"
  execute ":vsplit ~/.gvimrc"
  execute ":vsplit ~/.zshrc"
endfunction          

" ---------------------------------------------------------------------------
" Keymappings
" ---------------------------------------------------------------------------
let mapleader = ","
"let g:user_zen_expandabbr_key = '<leader>e'   
let g:sparkupExecuteMapping = '<leader>e'

" Source the .vimrc and .gvimrc at once
nmap <silent> <leader>sv :so $MYVIMRC<CR> :so $MYGVIMRC<CR>

map <leader><space> zf
map <leader><S-space> zo
map <leader>n :e.<CR>
map <leader>= <c-W>=
map <leader><leader> <c-W><c-W>
map <leader>C :call OpenConfig()<CR>
map K <nop>
map H 0
map L $
map T <C-v>
imap <S-space> <Esc>
nnoremap <leader>/ :set hlsearch!<CR>

" window
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>
" buffer
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" ---------------------------------------------------------------------------
" Vundle package management
" ---------------------------------------------------------------------------
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Movement
Bundle "ragtag.vim"
Bundle "AutoClose"
Bundle "repeat.vim"
Bundle "surround.vim"
Bundle "https://github.com/vim-scripts/bufexplorer.zip.git"

" UI Enhancements 
Bundle 'mutewinter/vim-indent-guides'
Bundle 'dickeytk/status.vim'
Bundle 'https://github.com/scrooloose/syntastic.git'

" HTML
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle "https://github.com/scrooloose/nerdcommenter.git"
Bundle "https://github.com/vim-scripts/matchit.zip.git"

" Language Bonus
Bundle 'vim-ruby/vim-ruby'
Bundle 'leshill/vim-json'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'itspriddle/vim-jquery'

" Ctags
Bundle 'https://github.com/vim-scripts/taglist.vim.git'

" Libraries
Bundle 'L9'
Bundle 'tpope/vim-repeat'

filetype plugin indent on

" ---------------------------------------------------------------------------
" Plugins
" ---------------------------------------------------------------------------

" ----------------------------------------------------------------------------
"  Auto Commands
" ----------------------------------------------------------------------------
" Jump to last position of buffer when opening
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                         \ exe "normal g'\"" | endif

au BufRead,BufNewFile *.css set ft=css syntax=css3
au BufRead,BufNewFile *.html set ft=html syntax=html5
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.aspx set filetype=html syntax=html5

" ---------------------------------------------------------------------------
" System
" ---------------------------------------------------------------------------
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f\                     " file name
    set titlestring+=%h%m%r%w                " flags
    set titlestring+=\ >\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}        " working directory
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
iab adress     address
iab ling       long
iab lavel      label
iab sleect     select
iab slelect    select
iab ident      indent
iab vind       bind
