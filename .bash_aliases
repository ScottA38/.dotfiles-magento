export MAG_DIR="/var/www/html/burpee"
export DOCK_DIR="/var/www/html/docker-magento2"

#general bash shortcuts

alias cl="clear;"

alias showpath="echo $PATH | tr ':' '\n'";

function wgrep () {
	grep -A 3 -B 3 $1;
}

#MacOS polyfills
alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"

#Magento-related shortcuts
alias mag_hard_clr="pushd $MAG_DIR; rm -rfv generated/code pub/static/adminhtml/* pub/static/frontend/* pub/static/deployed_version.txt var/view_preprocessed/pub/* var/cache/* var/page_cache/*; popd"

alias mag_clear="rm -rfv "$MAG_DIR"/var/generation/*; rm -rfv "$MAG_DIR"var/cache/*"

alias cf="$MAG_DIR/bin/magento c:fl;"

#alias deploy_theme="npm run lint:fix && gulp scss && cf"

alias disable_caches="bin/magento c:dis full_page block_html layout;"

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

#success message
echo "aliases loaded successfully!"
