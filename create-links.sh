cd dotfiles
for file in *
do
    cp -r "$file" "$HOME/.$file"
done

