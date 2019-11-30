#!/bin/bash
# check existence of .vimrc, .vim/, .vim/pack/plugins/start
mkdir -p ~/.vim/pack/plugins/start
if [[ -f ~/.vimrc && ! -f ~/.vimrc.old ]]; then
    echo "~/.vimrc already exists. Renaming it ~/.vimrc.old"
    mv ~/.vimrc ~/.vimrc.old
fi
cp "$(dirname "$0")/.vimrc" ~/.vimrc

# install plugins defined in plugins.list
list_file="$(dirname "$0")/plugins.list"
while IFS= read -r line
do
    echo "installing $line"
    pushd ~/.vim/pack/plugins/start > /dev/null
    git clone "$line" 2>/dev/null
    popd > /dev/null
done <"$list_file"
