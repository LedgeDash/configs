#!/bin/bash

### Vim setup
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

# install colorschemes

if [[ ! -d ~/.vim/colors ]]; then
    pushd ~/.vim > /dev/null
    git clone git@github.com:flazz/vim-colorschemes.git
    mv vim-colorschemes/colors .
    rm -rf vim-colorschemes
    popd > /dev/null
fi

### Tmux setup
# tmux config
if [[ -f ~/.tmux.conf && ! -f ~/.tmux.conf.old ]]; then
    mv ~/.tmux.conf ~/.tmux.conf.old
fi
cp "$(dirname "$0")/.tmux.conf" ~/.tmux.conf


### bash setup
if [[ -f ~/.bashrc && ! -f ~/.bashrc.old ]]; then
    echo "~/.bashrc already exists. Renaming it ~/.bashrc.old"
    mv ~/.bashrc ~/.bashrc.old
fi
cp "$(dirname "$0")/.bashrc" ~/.bashrc

if [[ -f ~/.bash_aliases && ! -f ~/.bash_aliases.old ]]; then
    mv ~/.bash_aliases ~/.bash_aliases.old
fi
cp "$(dirname "$0")/.bash_aliases" ~/.bash_aliases

if [[ -f ~/.bash_color && ! -f ~/.bash_color.old ]]; then
    mv ~/.bash_color ~/.bash_color.old
fi
cp "$(dirname "$0")/.bash_color" ~/.bash_color

source ~/.bashrc
