Hydrogen: Vim configuration
=======

The basic building block of my workflow: VIM configurations, tailored to run on top of the latest [MacVim](http://github.com/b4winckler/macvim/downloads) snapshot. 

## Installation 

If you want to follow the linking directions below make sure to clone this directory in your root:

        cd ~/
        git clone https://github.com/lrbecker/hydrogen.git
        mv hydrogen .hydrogen

Symbolically linking the folders makes setup much easier, then Vim knows where to load the configuration files. You can also move the files into `.vim` if you prefer.

        ln -s ~/.hydrogen ~/.vim

Since .vimrc file and .gvimrc configuration files are bundled with the rest of this directory. We need to link them as well.

        ln -s ~/.vim/.vimrc ~/.vimrc
        ln -s ~/.vim/.gvimrc ~/.gvimrc

## Next Steps

When MacVim is running, make sure to run Vundle to grab all the plugins.

        :BundleInstall
