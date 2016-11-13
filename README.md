# dotfiles

## Vim

### Installation
Clone this repo and run `install.sh`:
```bash
git clone https://github.com/omohokcoj/vim-u-want.git ~/vimrc
cd ~/vimrc
chmod +x ./install.sh
./install.sh
```

### Additional installations
* [silver_searcher](https://github.com/ggreer/the_silver_searcher)
```bash
brew install the_silver_searcher
```
* Ctag
```bash
brew install ctags
```

## Tmux

### Installation
```bash
mv tmux.conf ~/.tmux.conf
```

### Additional installations
* [tmux-powerline](https://github.com/erikw/tmux-powerline)
```bash
git clone https://github.com/erikw/tmux-powerline.git ~/.tmux/tmux-powerline
```
* reattach-to-user-namespace
```bash
brew install reattach-to-user-namespace --HEAD
```
