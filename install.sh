SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ -f ~/.vimrc ]; then
  cp ~/.vimrc "$SCRIPT_PATH/vimrc-old"
fi

ln -sf "$SCRIPT_PATH/vimrc" ~/.vimrc

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
fi

vim +PluginInstall +qall
