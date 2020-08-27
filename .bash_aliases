#     _                  _                 _  _
#    | |__    __ _  ___ | |__        __ _ | |(_)  __ _  ___   ___  ___
#    | '_ \  / _` |/ __|| '_ \      / _` || || | / _` |/ __| / _ \/ __|
#  _ | |_) || (_| |\__ \| | | |    | (_| || || || (_| |\__ \|  __/\__ \
# (_)|_.__/  \__,_||___/|_| |_|_____\__,_||_||_| \__,_||___/ \___||___/
#                             |_____|
alias mng='python manage.py'
alias diary="vim +'normal Go' +'r!date' ~/projects/me.txt"
alias runadmin="URL_CONF=admin python manage.py runserver 0.0.0.0:8008"
alias ca='conda activate'
alias reboot='reboot --no-wall'
alias shutdown='shutdown now'
alias dps='docker ps --format "{{.Image}}: {{.Status}}"'
alias work="cd ~/dev/chemcurator_django; git diff --name-only | xargs vi -p"
alias workdiff="cd ~/dev/chemcurator_django; git diff --name-only staging-release | xargs vi -p"
alias workv="cd ~/dev/chemcurator_vuejs; git diff --name-only | xargs vi -p"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
# alias pypkg='cd "$(python -c 'import site; print(site.getsitepackages()[0])')"'
