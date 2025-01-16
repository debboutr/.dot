== Setting up the dotfiles!!


# How to update neovim to specific tag
``` 
 git checkout v0.8.1
 make distclean
 make CMAKE_BUILD_TYPE=RelWithDebInfo -j4
 sudo make install
 ```


# this is how to install zoxide!
```
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

# this is how to install fzf!!
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
