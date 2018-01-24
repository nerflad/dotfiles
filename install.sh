#!/bin/bash

# check depends
which curl git sudo >/dev/null

if [ $? -gt 0 ]; then
    echo "One or more dependencies is not met."
    exit 1
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
    git clone https://github.com/vim-airline/vim-airline || (pushd vim-airline; git pull; popd)
    git clone https://github.com/vim-airline/vim-airline-themes || (pushd vim-airline-themes; git pull; popd)
    git clone https://github.com/mhinz/vim-signify || (pushd vim-signify; git pull; popd)
    git clone https://github.com/pangloss/vim-javascript || (pushd vim-signify; git pull; popd)
    git clone https://github.com/mhinz/vim-startify || (pushd vim-startify; git pull; popd)
popd



echo Creating /home symlinks...
for i in $(pwd)/fish/*.fish
do
    file=`basename $i`
    ln -s $i ~/.config/fish/functions/$file && echo ~/.config/fish/functions/$file
done
ln -s $(pwd)/config.fish ~/.config/fish/config.fish && echo config.fish
ln -s $(pwd)/vimrc ~/.vimrc && echo ~/.vimrc
ln -s $(pwd)/screenrc ~/.screenrc && echo ~/.screenrc



echo Creating privileged symlinks...
sudo ln -s $(pwd)/solarized.vim /usr/share/vim/vim80/colors/solarized.vim &&\
    echo /usr/share/vim/vim80/colors/solarized.vim
read -p "Overwrite global vimrc, backing up original? (y/N): " choice
case $choice in
    y|Y )
        if [ -f /etc/vimrc ]; then
            currenttime=`date +"%T"`
            sudo mv /etc/vimrc /etc/vimrc.$currenttime.bak
        fi
        sudo ln -s $(pwd)/vimrc /etc/vimrc || echo /etc/vimrc;;
    * )
esac
