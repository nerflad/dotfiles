#!/bin/bash

if ! [ $PWD ]; then
    PWD=`pwd`
fi


echo Creating .vim directory tree if necessary...
for i in .vim .vim/backup .vim/swap .vim/bundle .vim/autoload
do
    if ! [ -d ~/$i ]; then
        mkdir ~/$i
    fi
done

if ! [ -e ~/.vim/autoload/pathogen.vim ]; then
    echo Installing pathogen...
    curl -Lsso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# download pathogen plugins
pushd ~/.vim/bundle
    git clone https://github.com/vim-airline/vim-airline
    git clone https://github.com/vim-airline/vim-airline-themes
    git clone https://github.com/mhinz/vim-signify
popd



echo Creating /home symlinks...
for i in $PWD/fish/*.fish
do
    file=`basename $i`
    ln -s $i ~/.config/fish/functions/$file && echo ~/.config/fish/functions/$file
done
ln -s $PWD/config.fish ~/.config/fish/config.fish && echo config.fish
ln -s $PWD/vimrc ~/.vimrc && echo ~/.vimrc



echo Creating privileged symlinks...
sudo ln -s $PWD/solarized.vim /usr/share/vim/vim80/colors/solarized.vim &&\
    echo /usr/share/vim/vim80/colors/solarized.vim
read -p "Overwrite global vimrc, backing up original? (y/N): " choice
case $choice in
    y|Y )
        if [ -f /etc/vimrc ]; then
            currenttime=`date +"%T"`
            sudo mv /etc/vimrc /etc/vimrc.$currenttime.bak
        fi
        sudo ln -s $PWD/vimrc /etc/vimrc || echo /etc/vimrc;;
    * )
esac
