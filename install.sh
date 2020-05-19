#!/bin/bash

# check depends
which curl git sudo >/dev/null
[ $? -gt 0 ] && (echo "One or more dependencies not met."; exit 1)

# TODO: switch to vim's new native package system
# TODO: if a repo is cloned but not in the list, ask to rm it.
# vim plugin list
# structure: (username repo-name)
declare -ar plugins=(
    vim-scripts     Colour-Sampler-Pack
    vim-scripts     ScrollColors
    vim-airline     vim-airline
    vim-airline     vim-airline-themes
    qpkorr          vim-bufkill
    jamessan        vim-gnupg
    mhinz           vim-signify
    pangloss        vim-javascript
    mhinz           vim-startify
    mustache        vim-mustache-handlebars
);

# symlinks
# structure: (filename link-path)
declare -ar symlinks=(
    config.fish     ~/.config/fish/config.fish
    vimrc           ~/.vimrc
    screenrc        ~/.screenrc
    solarized.vim   ~/.vim/colors/solarized.vim
);


# create vim user directory tree if needed
for i in . backup swap bundle autoload colors ftdetect ftplugin
do [ -d ~/.vim/$i ] || mkdir ~/.vim/$i; done


# install pathogen
[ -e ~/.vim/autoload/pathogen.vim ] ||\
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim;

# clone/update vim plugins
echo Cloning vim plugins...

for ((i = 0 ; i <= $((${#plugins[@]} - 1)) ; i = i+2 )); do
    user=${plugins[$i]}
    repo=${plugins[$i+1]}
    [ -d ~/.vim/bundle/$repo ] && \
    (cd ~/.vim/bundle/$repo; git pull 1>/dev/null && echo ✅ $repo) && continue;
    git clone https://github.com/$user/$repo ~/.vim/bundle/$repo
done
printf "\n"


echo Creating home symlinks...
for i in $(pwd)/fish/*.fish
do
    file=`basename $i`
    ln -s $i ~/.config/fish/functions/$file 2>/dev/null && \
    (echo ~/.config/fish/functions/✅ $file)
done

for ((i = 0 ; i <= $((${#symlinks[@]} - 1)) ; i = i+2 )); do
    file=${symlinks[i]}
    path=${symlinks[i+1]}
    [ -e $path ] && (echo ✅ $file) && continue
    ln -s $(pwd)/$file $path && echo ✅ ${symlinks[i]}
done

read -p "Create privileged symlinks? (y/N): " choice
case $choice in
    y|Y )
        sudo mv /etc/wikicurses.conf /etc/wikicurses.conf.bak
        sudo ln -s $(pwd)/wikicurses.conf /etc/wikicurses.conf \
          && echo ✅ wikicurses.conf

        sudo ln -s $(pwd)/solarized.vim /usr/share/vim/vim82/colors/solarized.vim &&\
          echo ✅ /usr/share/vim/vim82/colors/solarized.vim

        read -p "Overwrite global vimrc, backing up original? (y/N): " choice
        case $choice in
            y|Y )
                if [ -f /etc/vimrc ]; then
                    currenttime=`date +"%T"`
                    sudo mv /etc/vimrc /etc/vimrc.$currenttime.bak
                fi
                sudo ln -s $(pwd)/vimrc /etc/vimrc && echo ✅ /etc/vimrc;;
            * )
        esac;;
    * )
esac
