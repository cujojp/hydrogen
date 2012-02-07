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
Bundle 'https://github.com/molok/vim-smartusline'
Bundle 'https://github.com/greyblake/vim-preview.git'

" Libraries
Bundle 'L9' 

" Movement
Bundle "ragtag.vim"
Bundle "AutoClose"
Bundle "repeat.vim"
Bundle "surround.vim"
Bundle "bufexplorer.zip"

" HTML
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle "https://github.com/scrooloose/nerdcommenter.git"
Bundle "https://github.com/vim-scripts/matchit.zip.git"

" Syntax
Bundle 'vim-ruby/vim-ruby'
Bundle 'leshill/vim-json'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'itspriddle/vim-jquery'
Bundle 'bbommarito/vim-slim.git'

" Ctags
Bundle 'https://github.com/vim-scripts/taglist.vim.git'

" Git
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'


filetype plugin indent on

