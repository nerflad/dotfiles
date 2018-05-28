#!/usr/bin/fish

set wget (which wget ^ /dev/null)

if [ -z $wget ]
    echo This script depends on wget. Install it to continue.
    exit 1
end

# grabs the fish syntax highlighting rules for vim from github

pushd /usr/share/vim/vim81/syntax
sudo wget https://raw.githubusercontent.com/vim-scripts/fish-syntax/master/syntax/fish.vim

cd /usr/share/vim/vim81/ftplugin
sudo wget https://raw.githubusercontent.com/vim-scripts/fish-syntax/master/ftplugin/fish.vim

# this wasn't a directory on my machine?
if not [ -d /usr/share/vim/vim81/ftdetect ]
    sudo mkdir /usr/share/vim/vim81/ftdetect
end

cd /usr/share/vim/vim81/ftdetect
sudo wget https://raw.githubusercontent.com/vim-scripts/fish-syntax/master/ftdetect/fish.vim

pushd
echo Fish syntax successfully grabbed from Github hopefully :\)
