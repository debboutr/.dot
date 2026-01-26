# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#EVERYTHING AFTER THIS LINE, I HAVE ADDED!!
#######################################################################

# not sure how, but this will maitain history between tmux and bash
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth:erasedups

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=-47
HISTFILESIZE=-47

# check if gdrive is already mounted
if [[ $(find ~/.gdrive/gdrive/ -maxdepth 1 -type f | wc -l) -eq 0 ]]; then
  google-drive-ocamlfuse ~/.gdrive/gdrive/
fi

# this is added from the node install that I use
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\033[00m\]\[\033[01;32m\]\w\[\033[00m\] '
