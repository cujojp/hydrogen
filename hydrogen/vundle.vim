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
Bundle 'surround.vim'
Bundle 'c9s/bufexplorer'
Bundle 'rstacruz/sparkup.git', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'mirell/vim-matchit'
Bundle 'leshill/vim-json'
Bundle 'vim-scripts/netrw.vim.git'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'bbommarito/vim-slim.git'
Bundle 'groenewege/vim-less.git'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'nathanaelkane/vim-indent-guides.git'


filetype plugin indent on
