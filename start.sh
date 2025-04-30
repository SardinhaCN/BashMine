#!/bin/bash
clear

var=$(find xmrig -type d -name "build")

if [ -n "$var" ]; then
    bash MenuMiner.Sh
else
    bash InstallMiner.sh
fi

