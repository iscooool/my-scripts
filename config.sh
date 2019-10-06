#!/bin/bash

# the name of virtualenv to be created
MY_VENV='mlenv'

# change source
if [ -r /etc/apt/sources.list ]; then
    sudo cp /etc/apt/sources.list /etc/apt/sources_init.list
    sudo rm /etc/apt/sources.list
fi
sudo cp ./sources.list /etc/apt/
sudo apt-get -y update
sudo apt-get -y upgrade

# install tools for c/c++, python3, pip3
sudo apt-get -y install build-essential cmake python3-dev
sudo apt-get -y install python3-pip
sudo apt-get -y install tmux
sudo apt-get -y install openssh-server openssh-client
sudo apt-get -y install cloc curl autojump
sudo apt-get -y install openssl
sudo apt-get -y install libcurl4-openssl-dev libssl-dev
# change the source of pip3
mkdir ~/.pip
sudo cp ./pip.conf ~/.pip/
pip3 install --upgrade pip
pip3 install virtualenv
pip3 install virtualenvwrapper

cat ./bashrc-append >> ~/.bashrc
source ~/.bashrc


# install vim and vim plugins
sudo apt-get -y install vim
if [ -r ~/.vimrc ]; then
    sudo rm ~/.vimrc
    sudo cp ./.vimrc ~
else
    sudo cp ./.vimrc ~
fi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c 'PluginInstall' -c 'qa!'
python3  ~/.vim/bundle/YouCompleteMe/install.py --clang-completer

# install my custom python virtualenv
mkvirtualenv -p /usr/bin/python3 $MY_VENV
workon $MY_VENV
pip3 install -r ./requirements.txt
deactivate

# configure tmux
[ -r ~/.tmux.conf ] && sudo rm ~/.tmux.conf
sudo cp .tmux.conf ~
