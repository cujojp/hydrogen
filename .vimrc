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
"set backupdir=~/.vim/backup                  " directory to place the backup files
"set directory=~/.vim/tmp                     " directory to place swap files in
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
function! MyConfigurationFiles()
  execute ":e ~/.vimrc"
  execute ":vsplit ~/.gvimrc"
  execute ":vsplit ~/.zshrc"
endfunction          

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" http://www.gregsexton.org/2011/04/enhancing-window-movement-and-positioning-in-vim/
function! PasteWindow(direction) "{{{
    if exists("g:yanked_buffer")
        if a:direction == 'edit'
            let temp_buffer = bufnr('%')
        endif

        exec a:direction . " +buffer" . g:yanked_buffer

        if a:direction == 'edit'
            let g:yanked_buffer = temp_buffer
        endif
    endif
endf "}}}

"yank/paste buffers
:nmap <silent> <leader>wy  :let g:yanked_buffer=bufnr('%')<cr>
:nmap <silent> <leader>wd  :let g:yanked_buffer=bufnr('%')<cr>:q<cr>
:nmap <silent> <leader>wp :call PasteWindow('edit')<cr>
:nmap <silent> <leader>ws :call PasteWindow('split')<cr>
:nmap <silent> <leader>wv :call PasteWindow('vsplit')<cr>
:nmap <silent> <leader>wt :call PasteWindow('tabnew')<cr>


" Displays the output of a shell command into a buffer
" http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction


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
map <leader>b :b#<CR>
map <leader>C :call MyConfigurationFiles()<CR>
map K <nop>
map H 0
map L $
map T <C-v>

" yank to end of line, like D
map Y y$

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

nnoremap <leader>/ :set hlsearch!<CR>
imap <S-space> <Esc>

" Source the .vimrc and .gvimrc at once
nmap <silent> <leader>sv :so $MYVIMRC<CR> :so $MYGVIMRC<CR>

" ---------------------------------------------------------------------------
" Vundle package management
" ---------------------------------------------------------------------------
 set rtp+=~/.vim/vundle.git/ 
 call vundle#rc()

 Bundle "jQuery"
 Bundle "ack.vim"
 Bundle "ragtag.vim"
 Bundle "AutoClose"
 Bundle "repeat.vim"
 Bundle "surround.vim"
 Bundle "file-line"
 Bundle "SuperTab"
 Bundle "Align"
 Bundle "taglist"
 Bundle "git://git.wincent.com/command-t.git"
 Bundle "https://github.com/mattn/zencoding-vim.git"
 Bundle "https://github.com/scrooloose/nerdcommenter.git"
 Bundle "https://github.com/vim-scripts/bufexplorer.zip.git"
 Bundle "https://github.com/vim-scripts/matchit.zip.git"

" ---------------------------------------------------------------------------
" Plugins
" ---------------------------------------------------------------------------
" Command-T
let g:CommandTMaxHeight = 10

" Buftabs for the quick
noremap <A-left> :bprev<CR>
noremap <A-right> :bnext<CR>

" ----------------------------------------------------------------------------
"  Auto Commands
" ----------------------------------------------------------------------------
" Jump to last position of buffer when opening
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                         \ exe "normal g'\"" | endif

" Don't use cindent for javascript
autocmd FileType javascript setlocal nocindent

au BufRead,BufNewFile *.css set ft=css syntax=css3
au BufRead,BufNewFile *.html set ft=html syntax=html5
au BufRead,BufNewFile *.json set ft=json syntax=javascript
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.as set filetype=actionscript
au BufRead,BufNewFile *.aspx set filetype=html5

" ---------------------------------------------------------------------------
" System
" ---------------------------------------------------------------------------
" Nice window title
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

