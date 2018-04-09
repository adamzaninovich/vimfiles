# Adam Zaninovich's Vim Configuration

## Goals

* be as simple as possible
* only add what I really need
* revisit often, removing unused configurations and plugins
* try new things, don't let this become stale
* understand how and why everything works the way it does and why it's there

## Installation

Clone this repository into `~/.config/nvim` and link files for standard vim, if
necessary:

```
mkdir -p $HOME/.config
git clone git@github.com:adamzaninovich/vimfiles.git $HOME/.config/nvim
```

Installation for nvim is finished there; if using standard vim, continue...

```
ln -s $HOME/.config/nvim $HOME/.vim
ln -s $HOME/.config/nvim/init.vim $HOME/.vimrc
```

After that, all that's left is to run upgrade and install on Plug inside vim...

```
:PlugUpgrade "Updates Plug to latest version
:PlugInstall "Installs all plugins
```

Restart vim, and you're ready to go.
