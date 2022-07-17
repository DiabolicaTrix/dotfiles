for file in dotfiles/*
do
  if [ -d "$file" ]; then
    rm -rf "$HOME/.$file"
    ln -s -f "$PWD/dotfiles/$file/" "$HOME/.$file"
  else
    ln -f "$file" "/home/$USER/.$file" 
  fi
done

rm -rf "$HOME/.oh-my-zsh/custom"
ln -s -f "$PWD/omz-custom/" "$HOME/.oh-my-zsh/custom"
