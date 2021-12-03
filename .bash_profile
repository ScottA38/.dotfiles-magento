export MAG_DIR="/var/www/html/magento-2"
export NGINX_ERR="/var/log/nginx/error.log"
export MAG_ERR="/var/www/html/magento-2/var/log/system.log"
export XDEBUG_LOG="/var/log/xdebug/xdebug.log"
export PHP_FPM_CONF="/etc/php/7.3/fpm/php.ini"
export PHP_CLI_CONF="/etc/php/7.3/cli/php.ini"
export PHP_LOG="/tmp/php-error.log"

function findfirst () {
	find $1 -name $2 | head -n 1
}

function catfirst () {
	cat $(find $1 -name $2 | head -n 2)
}

function fac {
	git fetch && git checkout $1;
}

function gswitch {
	if [ ! -z $1 ]; then
		for CONFIG in $GCLOUD_CONFIGS
		do
        		if [ $CONFIG == $1 ]; then
                		export CLOUDSDK_ACTIVE_CONFIG_NAME=$1;
				return
        		fi
		done
	fi

	echo "'$1' is not a valid config name!";
}

function get_versions {
	grep -Proi --include="*.php" "1\.\d+\.\d+" $1 |  cut -d ":" -f2 
}

function branch-history {
	while read -r line
	do
		print -P "%F{#${openssl rand -hex 3)}$line%f";
	done <<< git reflog | grep -o 'checkout: moving from .* to ' | sed -e 's/checkout: moving from //' -e 's/ to $//' | head -20
}


#if [ -f ~/.bashrc ]; then
#  . ~/.bashrc
#fi

if [ -f ~/.vars ]; then
	. ~/.vars
fi

export 	PS1="\D{%H:%M:%S} \[\e]0;\u@\h: \w\a\] 🏠 ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\](\$CLOUDSDK_ACTIVE_CONFIG_NAME)\n \$ "
export COMPOSER_AUTH='{"http-basic":{"repo.magento.com": {"username": "a6c89664b6543ccc7a5fd17824dee1dd", "password": "8455c1cfc1e37aad319ba814a5f7bc0f"}}}'

if [ -z $initial_login ]
then
	export initial_login=1;
	. ~/.startup;
fi
