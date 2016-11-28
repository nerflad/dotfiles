#!/bin/bash

if ! [ $PWD ]; then
    PWD=`pwd`
fi


echo Creating /home symlinks...

for i in $PWD/fish/*.fish
do
    file=`basename $i`
    ln -s $i ~/.config/fish/functions/$file && echo ~/.config/fish/functions/$file
done

ln -s $PWD/vimrc ~/.vimrc && echo ~/.vimrc


echo Creating privleged symlinks

sudo ln -s $PWD/solarized.vim /usr/share/vim/vim80/colors/solarized.vim && echo /usr/share/vim/vim80/colors/solarized.vim

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
