#!/bin/sh

nim c -f arenaserver/arenaserver && \
read  -p "arenaserver done, enter to continue" a && \
#nim c -f -d:fakeData arenaserver/arenaserver && \
#nim c -f -d:scripting server/patch && 
nim c -f server/patch && 
read  -p "server/patch done, enter to continue" a && \
nim c -f -d:BATTLE_MODE -o:server/libbattle.so server/patch  && \
echo "final build done, good luck!"