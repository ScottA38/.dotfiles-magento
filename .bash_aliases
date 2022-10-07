#general bash shortcuts

alias cl="clear;"

alias showpath="echo $PATH | tr ':' '\n'"

alias t30="tail -fn 30"

alias wgrep="grep -nA 3 -B 3"

alias 1grep="grep -nm1"

alias cpv="rsync --progress"

alias quote-words="sed 's/[^[:space:],]\+/\"&\"/g'"

alias pew="gunzip"

alias php2json="tr \"[]\" \"{}\" | tr \"''\" '\"\"' | sed \"s/=>/:/g\""

#mysql shortcuts

alias mysqlhist="cat ~/.mysql_history | sed 's+\\\\040+ +g' | more +G"

alias mysqllocal="mysql --defaults-group-suffix='local'"
alias mysqldev="mysql --defaults-group-suffix='dev'"
alias mysqlstg="mysql --defaults-group-suffix='stg'"

alias mysqldump-strip-data="perl -0777 -pe 's/LOCK TABLES.*?UNLOCK TABLES;//igs' > ~/Documents/dumps/ddev_schema_2022-09-29.sql"

#ssh shortcuts

alias ssh-hosts="grep -P \"^Host ([^*]+)$\" $HOME/.ssh/config | sed 's/Host //'"
alias dev-db-tunnel="ssh summit-dev -fNL 3315:23.251.136.82:3306"

#python tool shortcuts

alias py-json="xsel --clipboard --output | python3 -m json.tool"

#MacOS polyfills
alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"

#Magento-related shortcuts
alias mag_clear="rm -rfv "$MAG_DIR"/var/generation/*; rm -rfv "$MAG_DIR"var/cache/*"

alias n98-magerun-2="php7.3 /usr/local/bin/n98-magerun2.phar"

alias killconsumers="pkill -f pkill queue\:consumers\:start"

#alias deploy_theme="npm run lint:fix && gulp scss && cf"

alias refresh="npx grunt refresh";

#git shortcuts

alias currbr="git branch --show-current"

alias lastmsg="git log -1 --pretty=%B;"

alias gs="git status"

#docker shortcuts

alias containernames='docker ps --format "table {{.Names}}\t@\t{{.Ports}}\t({{.ID}}):\t{{.Status}}"'

alias rmdockerimgs='docker rm -vf $(docker ps -a -q)'

#docker-magento shortcuts

alias startvarnish='docker-compose exec -u root varnish bash service varnish start'

# gcloud SDK shortcuts

alias glinstances='gcloud compute instances list'

if [ -f ~/.scandipwa.bash_aliases ]; then
	. ~/.scandipwa.bash_aliases;
fi

#stupid overrides
alias magerun="/usr/local/bin/n98-magerun2-3.2.0.phar"

#PHP overrides

alias php72="/usr/local/Cellar/valet-php@7.2/7.2.34_4/bin/php"
