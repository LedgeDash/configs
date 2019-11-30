#!/bin/bash
echo "setup bash and vim"
echo "$(dirname "$0")/.vimrc"

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
    echo "$line"
    pushd ~/.vim/pack/plugins/start
    git clone "$line"
    popd > /dev/null
done <"$list_file"
