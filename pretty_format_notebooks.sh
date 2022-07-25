#!/bin/sh

if ! command -v jq &> /dev/null
then
    echo "jq could not be found."
    echo "Install with 'brew install jq'."
    exit
fi

if ! command -v sponge &> /dev/null
then
    echo "sponge could not be found."
    echo "Install with 'brew install sponge'."
    exit
fi

find . -name \*.ipynb -exec sh -c "jq < \"{}\" | sponge \"{}\" " \;
