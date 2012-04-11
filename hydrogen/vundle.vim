" ---------------------------------------------------------------------------
" Vundle package management
" ---------------------------------------------------------------------------
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
"Bundle 'gmarik/vundle'

" System
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'ervandew/supertab.git'
Bundle 'Lokaltog/vim-powerline.git'

" Libraries
Bundle 'L9' 

" Movement
Bundle "ragtag.vim"
Bundle "AutoClose"
Bundle "repeat.vim"
Bundle "surround.vim"
Bundle "bufexplorer.zip"
Bundle "chrisbra/NrrwRgn.git"

" HTML
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle "scrooloose/nerdcommenter.git"
Bundle "vim-scripts/matchit.zip.git"

" Syntax
Bundle 'vim-ruby/vim-ruby'
Bundle 'leshill/vim-json'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'itspriddle/vim-jquery'
Bundle 'bbommarito/vim-slim.git'
Bundle 'groenewege/vim-less.git'

" Ctags
Bundle 'vim-scripts/taglist.vim.git'


" Git
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'


filetype plugin indent on


" ---------------------------------------------------------------------------
" Plugin Configurations
" ---------------------------------------------------------------------------
let g:Powerline_symbols = 'fancy'

" Limit to 10 
let g:CommandTMaxHeight = 10

" refresh
nmap <silent> <Leader>T :CommandTFlush<CR>

