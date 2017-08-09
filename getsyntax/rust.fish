#!/usr/bin/fish
# grabs the rust syntax hightlighting rules for vim from the github rust-lang repo

set wget (which wget ^ /dev/null)

if [ -z $wget ]
    echo This script depends on wget. Install it to continue.
    exit 1
end


set vimdir /usr/share/vim/vim80

pushd $vimdir/syntax
sudo wget https://raw.githubusercontent.com/rust-lang/rust.vim/master/syntax/rust.vim

cd $vimdir/ftplugin
sudo wget https://raw.githubusercontent.com/rust-lang/rust.vim/master/ftplugin/rust.vim

# this may not be a directory
if not [ -d $vimdir/ftdetect ]
    sudo mkdir $vimdir/ftdetect
end

cd $vimdir/ftdetect
sudo wget https://raw.githubusercontent.com/rust-lang/rust.vim/master/ftdetect/rust.vim

cd $vimdir/compiler
sudo wget https://raw.githubusercontent.com/wting/rust.vim/master/compiler/rustc.vim
sudo wget https://raw.githubusercontent.com/wting/rust.vim/master/compiler/cargo.vim

cd $vimdir/autoload
sudo wget https://raw.githubusercontent.com/wting/rust.vim/master/autoload/rust.vim

cd $vimdir/indent
sudo wget https://raw.githubusercontent.com/wting/rust.vim/master/indent/rust.vim

pushd
echo Rust plugin successfully \(manually\) grabbed from Github. Hopefully :\)
