Hydrogen: Vim configuration
=======

The most basic building block of my workflow: VIM configurations, tailored to run on top of the latest [MacVim](http://github.com/b4winckler/macvim/downloads) snapshot. 

## Installation 
I prefer to keep my .vimrc file and .gvimrc configuration files bundled with the rest of this directory.

        ln -s ~/.hydrogen ~/.vim

To keep .vimrc + .gvimrc inside this directory don't forget to symbolically link them:

        ln -s ~/.vim/.vimrc ~/.vimrc
        ln -s ~/.vim/.gvimrc ~/.gvimrc

Or move them to the normal location:

        mv .vimrc ~/.vimrc
        mv .gvimrc ~/.gvimrc

