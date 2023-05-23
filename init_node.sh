#!/bin/sh

NODE_URL="https://nodejs.org/dist/v18.16.0/node-v18.16.0-darwin-x64.tar.gz"
NODE_PATH="$HOME/goinfre"
INSTALL="0"

while [ $INSTALL != "1" ] && [ $INSTALL != "2" ]
do
    echo "Where do you want to install node:"
    echo "1: goinfre"
    echo "2: Home"

    read INSTALL

    if [ $INSTALL == "1" ]; then
        NODE_PATH="$HOME/goinfre"
    elif [ $INSTALL == "2" ]; then
        NODE_PATH="$HOME"
    else
        echo "Not valid"
        clear;
    fi
done

if [ -d "$NODE_PATH/node-v18.16.0-darwin-x64" ]; then
    echo "node already Downloaded"
else
    echo Downloading node ....
    curl $NODE_URL -o $NODE_PATH/node.tar.gz
    cd $NODE_PATH; tar -xf node.tar.gz
fi

rm -rf node.tar.gz

grep -Hs "'$NODE_PATH/node-v18.16.0-darwin-x64/bin'" ~/.zprofile > /dev/null
if [ $? != 0 ]; then
    echo export PATH="$PATH:$NODE_PATH/node-v18.16.0-darwin-x64/bin" > ~/.zprofile
fi