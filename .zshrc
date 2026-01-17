# add fzf!!!
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "($dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
# Source/Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in powerlevel10k
# zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add plugins...
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git

# load completions
autoload -U compinit && compinit

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
# Ctrl-b for moving backwards through the prompt
# Ctrl-f for moving forwards, if there's no suggestion
# Ctrl-a to move to the start of the prompt
# Ctrl-e to move to the end of the prompt
# Ctrl-p go up in history
# Ctrl-n go down in history

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

alias ls='ls --color'
alias ll='ls -halF'
alias c='clear'
alias rm='gio trash'
alias brm='/usr/bin/rm '
alias xo='xdg-open'
alias mng='python manage.py'
alias tree='tree --gitignore'
alias vi='nvim'
alias hist='history | grep '
alias out='systemctl suspend'
alias ..='cd ..'
alias ...='cd ../..'
alias superlinode="ssh root@192.53.167.126"
alias linode='ssh rickd@192.53.167.126'
alias hostinger='ssh ricd@31.97.149.216'
alias hostingeroot='ssh root@31.97.149.216'
alias drone='drone.py && ./clean.sh && rm clean.sh'
alias edit='git diff --name-only | xargs nvim'

export EDITOR=nvim
export NVIM_APPNAME=nvimexample

# shell integration
eval "$(fzf --zsh)" # NOT WORKING!!!
# unalias zi
# eval "$(zoxide init zsh)"
eval "$(zoxide init --cmd cd zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

source $HOME/.local/bin/myfunctions.sh
