#!/usr/bin/fish

set wget (which wget ^ /dev/null)

if [ -z $wget ]
    echo This script depends on wget. Install it to continue.
    exit 1
end

# grabs the jsx syntax highlighting rules for vim from github

# this directory sometimes doesn't exist
if not [ -d /usr/share/vim/vim80/ftdetect ]
    sudo mkdir /usr/share/vim/vim80/ftdetect
end
pushd /usr/share/vim/vim80/ftdetect
sudo wget https://raw.githubusercontent.com/mxw/vim-jsx/master/ftdetect/javascript.vim

cd /usr/share/vim/vim80/syntax
sudo wget https://raw.githubusercontent.com/mxw/vim-jsx/master/after/syntax/jsx.vim

cd /usr/share/vim/vim80/ftplugin
sudo wget https://raw.githubusercontent.com/mxw/vim-jsx/master/after/ftplugin/jsx.vim

cd /usr/share/vim/vim80/indent
sudo wget https://raw.githubusercontent.com/mxw/vim-jsx/master/after/indent/jsx.vim

popd
echo jsx syntax successfully grabbed from Github hopefully :\)
