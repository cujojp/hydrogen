" ---------------------------------------------------------------------------
" Vundle package management
" ---------------------------------------------------------------------------
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'ervandew/supertab.git'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle "ragtag.vim"
Bundle "AutoClose"
Bundle "repeat.vim"
Bundle "surround.vim"
Bundle "bufexplorer.zip"
Bundle 'rstacruz/sparkup.git', {'rtp': 'vim/'}
Bundle "scrooloose/nerdcommenter.git"
Bundle 'mirell/vim-matchit'
Bundle 'vim-ruby/vim-ruby'
Bundle 'leshill/vim-json'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'bbommarito/vim-slim.git'
Bundle 'groenewege/vim-less.git'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'


filetype plugin indent on


