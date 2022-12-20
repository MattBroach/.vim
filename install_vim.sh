#!/bin/sh
ln -s ~/.vim/.vimrc ~/.vimrc 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"
vim -c 'CocInstall -sync coc-json coc-html coc-css coc-docker coc-eslint coc-go coc-jedi coc-prettier coc-sh coc-tsserver coc-yaml|q'
