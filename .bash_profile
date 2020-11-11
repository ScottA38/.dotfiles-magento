export PS1="\D{%H:%M:%S} \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

function wgrep () {
	grep -A 3 -B 3 $1;
}

function firstfile () {
	find $1 -name $2 | head -n 1
}

function catfirst () {
	cat $(find $1 -name $2 | head -n 2)
}

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

#add magento bin to PATH
echo $PATH | grep -q  "$MAG_DIR/bin" || export PATH=$PATH:"$MAG_DIR/bin";
cd $MAG_DIR
