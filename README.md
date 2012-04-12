Hydrogen: Vim configuration
=======

The basic building block of my workflow: VIM configurations, tailored to run on top of the latest [MacVim](http://github.com/b4winckler/macvim/downloads) snapshot. 

### Installation 

First clone the project:

        $> git clone https://github.com/lrbecker/hydrogen.git ~/.vim

__EXPERIMENTAL__ Navigate inside .vim and then run the rake tool which will link the .vimrc and .gvimrc files

        $> rake build

### Next Steps

When MacVim is running, make sure to run Vundle to grab all the plugins.

        :BundleInstall

