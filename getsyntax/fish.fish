#!/usr/bin/fish

# grabs the fish auto syntax highlighting rules for fish scripts from the
# github user vim-scripts repository.

pushd /usr/share/vim/vim80/syntax
sudo wget https://raw.githubusercontent.com/vim-scripts/fish-syntax/master/syntax/fish.vim

cd /usr/share/vim/vim80/ftplugin
sudo wget https://raw.githubusercontent.com/vim-scripts/fish-syntax/master/ftplugin/fish.vim

# this wasn't a directory on my machine?
if not [ -d /usr/share/vim/vim80/ftdetect ]
    sudo mkdir /usr/share/vim/vim80/ftdetect
end

cd /usr/share/vim/vim80/ftdetect
sudo wget https://raw.githubusercontent.com/vim-scripts/fish-syntax/master/ftdetect/fish.vim

pushd
echo Fish syntax successfully grabbed from Github hopefully :\)
