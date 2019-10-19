SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ -f ~/.vimrc ]; then
  cp ~/.vimrc "$SCRIPT_PATH/vimrc-old"
fi

ln -sf "$SCRIPT_PATH/vimrc" ~/.vimrc

if [ -f ~/.tmux.conf ]; then
  cp ~/.tmux.conf "$SCRIPT_PATH/tmux-old.conf"
fi

ln -sf "$SCRIPT_PATH/tmux.conf" ~/.tmux.conf

if [ -f ~/.zshrc ]; then
  cp ~/.zshrc "$SCRIPT_PATH/zshrc-old"
fi

ln -sf "$SCRIPT_PATH/.zshrc" ~/.zshrc
