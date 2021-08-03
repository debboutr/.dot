#!/bin/bash

# wget -O - https://www.anaconda.com/distribution/ 2>/dev/null | sed -ne 's@.*\(https:\/\/repo\.anaconda\.com\/archive\/Anaconda3-.*-Linux-x86_64\.sh\)">64-Bit (x86) Installer.*@\1@p' | xargs wget

if [[ `git -C $HOME/vimwiki status --porcelain` ]]; then
  echo "changes ${date}"
  git -C $HOME/vimwiki add . && git -C $HOME/vimwiki commit -am " changes..$(date -I)" && git -C $HOME/vimwiki push
else
  echo "no changes $(date -I)"
  git -C $HOME/vimwiki pull
fi
