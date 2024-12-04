alias linode="ssh root@192.53.167.126"
alias linode2='ssh rickd@192.53.167.126'
alias tinker="ssh bill@192.168.128.59"

alias ..='cd ..'
alias ...='cd ../..'
alias c='printf "\e[H\e[2J"'
alias tree='tree --gitignore'
alias hist='history | grep '



alias mng='python manage.py'
alias diary="nvim +'normal Go' +'r!date' ~/projects/me.txt"
alias runadmin="URL_CONF=admin python manage.py runserver 0.0.0.0:8008"
alias reboot='reboot --no-wall'
alias shutdown='shutdown now'
alias dps='docker ps --format "{{.Names}}: {{.Status}}"'
alias work="git diff --name-only | xargs vi -p"
alias workdiff="cd ~/dev/chemcurator_django; git diff --name-only staging-release | xargs vi -p"
alias workv="cd ~/dev/chemcurator_vuejs; git diff --name-only | xargs vi -p"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias workr="cd ~/dev/resolver; git diff --name-only | xargs vi -p"
alias ds='docker container stop $(docker container list --format "{{.Names}}")'
alias slash='docker rm -f postgresql \
            && docker run \
                -e POSTGRES_USER=postgres \
                --volume=postgresql:/var/lib/postgres/data \
                -e POSTGRES_PASSWORD=postgres \
                -e POSTGRES_DB=chemreg \
                --name=postgresql \
                --network=host \
                --detach \
                postgres:12.1'
alias build='mng migrate && mng loaddata chemreg/fixtures/* && mng runserver'
alias ventoy='/home/rick/.local/bin/ventoy-1.0.88-linux/ventoy-1.0.88/VentoyGUI.x86_64'
alias xo='xdg-open '
