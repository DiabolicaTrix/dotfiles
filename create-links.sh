for file in *
do
  if [ -d "$file" ]; then
    rm -rf "$HOME/.$file"
    ln -s -f "$PWD/$file/" "$HOME/.$file"
  else
    ln -f "$file" "/home/alexy/.$file" 
  fi
done
