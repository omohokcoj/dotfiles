# VIM U WANT
#### Simple vimrc will to turn your Vim into powerfull Ruby on Rails IDE. Just run installation script and you'll get a vim you want

## Installation
Clone this repo anywhere you want and run `install.sh`. For example:
```bash
git clone https://github.com/omohokcoj/vim-u-want.git ~/vimrc
cd ~/vimrc
chmod +x ./install.sh
./install.sh
```

## Additional instalations
* Install _GVim_ for copying from system clipboard in console vim (not only GVim!)
```bash
sudo apt-get install gvim
```
* If you want to use code searching you should install [silver_searcher](https://github.com/ggreer/the_silver_searcher)
```bash
sudo apt-get install silversearcher-ag 
```
* For jumping into methods definition and so on you need to install Ctag
```bash
sudo apt-get install exuberant-ctags
```

## Features

* <kbd>\\</kbd> + <kbd>e</kbd> - opens [NERDTree](https://github.com/scrooloose/nerdtree) file explorer
* <kbd>CTRL</kbd> + <kbd>p</kbd> - file searching with [ctrlp](https://github.com/kien/ctrlp.vim) plugin
* <kbd>.</kbd> or <kbd>,</kbd> - use [easy-motion](https://github.com/easymotion/vim-easymotion) plugin for quick code navigation
* Search anything in you code with typing `:Ag "pattern_here"`
* Jump to selected method with <kbd>CTRL</kbd> + <kbd>]</kbd> or <kbd>g</kbd> + <kbd>]</kbd> but before generate tags for your project with command `:TagsGenerate!`

## Notable changes

* Deletting command like <kbd>c</kbd>, <kbd>d</kbd>, <kbd>x</kbd>, <kbd>s</kbd> fills named buffer and keeps default buffer unchange. So you can do <kbd>dd</kbd> and after that paste your previously yanked string. If you want to paste deleted content, you should type <kbd>"</kbd> + <kbd>d</kbd> + <kbd>p</kbd> and so on.
