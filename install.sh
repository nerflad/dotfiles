#!/bin/bash

# check depends
which curl git sudo >/dev/null

if [ $? -gt 0 ]; then
    echo "One or more dependencies is not met."
    exit 1
fi


echo Creating .vim directory tree if necessary...
for i in .vim .vim/backup .vim/swap .vim/bundle .vim/autoload .vim/colors .vim/ftdetect .vim/ftplugin
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
    git clone https://github.com/vim-airline/vim-airline 2>/dev/null || (pushd vim-airline; git pull; popd)
    git clone https://github.com/vim-airline/vim-airline-themes 2>/dev/null || (pushd vim-airline-themes; git pull; popd)
    git clone https://github.com/qpkorr/vim-bufkill 2>/dev/null || (pushd vim-bufkill; git pull; popd)
    git clone https://github.com/jamessan/vim-gnupg 2>/dev/null || (pushd vim-gnupg; git pull; popd)
    git clone https://github.com/mhinz/vim-signify 2>/dev/null || (pushd vim-signify; git pull; popd)
    git clone https://github.com/pangloss/vim-javascript 2>/dev/null || (pushd vim-signify; git pull; popd)
    git clone https://github.com/mhinz/vim-startify 2>/dev/null || (pushd vim-startify; git pull; popd)
popd



echo Creating /home symlinks...
for i in $(pwd)/fish/*.fish
do
    file=`basename $i`
    ln -s $i ~/.config/fish/functions/$file 2>/dev/null && echo ~/.config/fish/functions/$file
done
ln -s $(pwd)/config.fish ~/.config/fish/config.fish 2>/dev/null && echo config.fish
ln -s $(pwd)/vimrc ~/.vimrc 2>/dev/null && echo ~/.vimrc
ln -s $(pwd)/screenrc ~/.screenrc 2>/dev/null && echo ~/.screenrc

ln -s $(pwd)/solarized.vim ~/.vim/colors/solarized.vim 2>/dev/null


read -p "Create privileged symlinks? (y/N): " choice
case $choice in
    y|Y )
        sudo ln -s $(pwd)/solarized.vim /usr/share/vim/vim81/colors/solarized.vim &&\
            echo /usr/share/vim/vim81/colors/solarized.vim
        read -p "Overwrite global vimrc, backing up original? (y/N): " choice
        case $choice in
            y|Y )
                if [ -f /etc/vimrc ]; then
                    currenttime=`date +"%T"`
                    sudo mv /etc/vimrc /etc/vimrc.$currenttime.bak
                fi
                sudo ln -s $(pwd)/vimrc /etc/vimrc || echo /etc/vimrc;;
            * )
        esac;;
    * )
esac
