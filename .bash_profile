export MAG_DIR="/var/www/html/burpee"
export DOCK_DIR="/var/www/html/docker-magento2"
export NGINX_ERR="/var/log/nginx/error.log"
export MAG_ERR="/var/www/html/burpee/var/log/system.log"
export XDEBUG_LOG="/var/log/xdebug/xdebug.log"
export PHP_FPM_CONF="/etc/php/7.3/fpm/php.ini"
export PHP_CLI_CONF="/etc/php/7.3/cli/php.ini"
export PHP_LOG="/tmp/php-error.log"

#add magento bin to PATH
echo $PATH | grep -q  "$MAG_DIR/bin" || export PATH=$PATH:"$MAG_DIR/bin";


export PS1="\D{%H:%M:%S} \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

function wgrep () {
	grep -nA 3 -B 3 $1;
}

function findfirst () {
	find $1 -name $2 &2> /dev/null | head -n 1
}

function catfirst () {
	cat $(find $1 -name $2 &2> /dev/null | head -n 2)
}

function t30 {
	tail -fn 30 $1;
}

function fac {
	git fetch && git checkout $1;
}

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi


#local setup
[ ! -f $PHP_LOG ] && touch $PHP_LOG
chmod 777 $PHP_LOG
cd $MAG_DIR
cl
