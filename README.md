Hydrogen: Vim configuration
=======

> The simplest basic building block is a solid editor.

How to install Hydrogen
-----------------------

        git clone https://github.com/lrbecker/hydrogen.git ~/.vim
        cd ~/.vim; rake build

Or manually link the `.vimrc` and `.gvimrc` files if __rake__ doesn't work properly: 

        ln -s ~/.vim/.vimrc ~/.vimrc
        ln -s ~/.vim/.gvimrc ~/.gvimrc

When MacVim is running, make sure to run Vundle to grab all the plugins.

        :BundleInstall

What's packed in this :
-----------------------------

### IDE/Behavior

#### [vundle](https://github.com/gmarik/vundle)
Vundle, the plug-in manager for Vim

#### [ctrlp](https://github.com/kien/ctrlp.vim)
Fuzzy file, buffer, mru and tag finder .

**Bound to:** `,f`

#### [sparkup](https://github.com/rstacruz/sparkup)
A parser for a condensed HTML format.

**Bound to:** `,e`

#### [tagbar](https://github.com/majutsushi/tagbar)
Vim plugin that displays tags in a window, ordered by class etc.

**Bound to:** `,t`

#### [bufexplorer](https://github.com/c9s/bufexplorer)
With bufexplorer, you can quickly and easily switch between buffers.

**Bound to:** `,be` 

#### [matchit](https://github.com/mirell/vim-matchit)
Import of Benji Fisher's matchit vim plugin, with history, extends `%` support.

#### [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
The premier commenting tool.

**Bound to:** `c<space>`

#### [nerdtree](https://github.com/scrooloose/nerdtree)
A tree explorer plugin for vim

**Bound to:** `,n`

#### [supertab](https://github.com/ervandew/supertab)
Perform all your vim insert mode completions with Tab.

#### [powerline](https://github.com/Lokaltog/vim-powerline)
Mega overhaul of the statusbar, colorized per mode.

#### [fugitive](https://github.com/tpope/vim-fugitive)
fugitive.vim: a Git wrapper so awesome, it should be illegal

#### [vim-git](https://github.com/tpope/vim-git)
Vim Git runtime files

### Bonus Syntax

  * json
  * javascript
  * coffee-script
  * slim
  * less

