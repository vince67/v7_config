#!/bin/bash
# install fisa vim config

echo '==============================='
echo 'start to install dependences...'
case "$OSTYPE" in
    darwin*)  brew install vim git pip curl;;
    linux*)   apt-get install vim exuberant-ctags git pip curl;;
    *)        echo "unknown: OS: $OSTYPE, U should install dependences by yourself" ;;
esac
pip install dbgp vim-debug pep8 flake8 pyflakes isort

echo '==============================='
echo 'start to download vimrc file...'
cp ~/.vimrc /tmp/vimrc.bak
curl -O https://raw.githubusercontent.com/fisadev/fisa-vim-config/master/.vimrc
mv .vimrc ~/.vimrc

echo '==============================='
echo 'start to install vim plugins...'
vim +BundleClean +BundleInstall! +qa
