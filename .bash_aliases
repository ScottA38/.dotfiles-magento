export MAG_DIR="/var/www/html/burpee"
export DOCK_DIR="/var/www/html/docker-magento2"

#general bash shortcuts

alias cl="clear;"

alias showpath="echo $PATH | tr ':' '\n'";

#ssh shortcuts

alias ssh-hosts="grep -P \"^Host ([^*]+)$\" $HOME/.ssh/config | sed 's/Host //'"

#MacOS polyfills
alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"

#Magento-related shortcuts
alias mag_hard_clr="pushd $MAG_DIR; rm -rfv generated/code pub/static/adminhtml/* pub/static/frontend/* pub/static/deployed_version.txt var/view_preprocessed/pub/* var/cache/* var/page_cache/*; popd"

alias mag_clear="rm -rfv "$MAG_DIR"/var/generation/*; rm -rfv "$MAG_DIR"var/cache/*"

alias cf="$MAG_DIR/bin/magento c:fl;"

alias discache="bin/magento c:dis full_page block_html layout;"

alias n98-magerun-2="php7.3 /usr/local/bin/n98-magerun2.phar"

#alias deploy_theme="npm run lint:fix && gulp scss && cf"

alias disable_caches="bin/magento c:dis full_page block_html layout;"

alias refresh="npx grunt refresh";

#git shortcuts

alias currbr="git branch --show-current"

alias doge="git log --decorate --oneline --graph --all;"

alias lastmsg="git log -1 --pretty=%B;"

alias gs="git status"

#docker shortcuts

alias containernames='docker ps --format "{{.Names}} \t@\t{{.Ports}}:\t\t\t{{.Status}}"'

alias rmdockerimgs='docker rm -vf $(docker ps -a -q)'

#docker-magento shortcuts

alias startvarnish='docker-compose exec -u root varnish bash service varnish start'

# gcloud SDK shortcuts

alias gswitch='gcloud config configurations activate'

alias glinstances='gcloud compute instances list'

if [ -f ~/.scandipwa.bash_aliases ]; then
	. ~/.scandipwa.bash_aliases;
fi
