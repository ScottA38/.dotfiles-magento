export MAG_DIR="/var/www/html/magento-2"
export NGINX_ERR="/var/log/nginx/error.log"
export MAG_ERR="/var/www/html/magento-2/var/log/system.log"
export XDEBUG_LOG="/var/log/xdebug/xdebug.log"
export PHP_FPM_CONF="/etc/php/7.3/fpm/php.ini"
export PHP_CLI_CONF="/etc/php/7.3/cli/php.ini"
export PHP_LOG="/tmp/php-error.log"

function wgrep () {
	grep -nA 3 -B 3 $1;
}

function findfirst () {
	find $1 -name $2 | head -n 1
}

function catfirst () {
	cat $(find $1 -name $2 | head -n 2)
}

function t30 {
	tail -fn 30 $1;
}

function fac {
	git fetch && git checkout $1;
}

#if [ -f ~/.bashrc ]; then
#  . ~/.bashrc
#fi

if [ -f ~/.bash_vars ]; then
	. ~/.bash_vars
fi

export PS1="\D{%H:%M:%S} \[\e]0;\u@\h: \w\a\] 🏠 ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "


if [ -z $initial_login ]
then
	export initial_login=1;
	. ~/.bash_startup;
fi
