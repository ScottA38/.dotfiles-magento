#Set prompt library
source $ZDOTDIR/submodules/agkozak-zsh-prompt/agkozak-zsh-prompt.plugin.zsh
source $ZDOTDIR/.zsh_functions

# Set prompt config
AGKOZAK_MULTILINE=0
AGKOZAK_LEFT_PROMPT_ONLY=1
AGKOZAK_COLORS_USER_HOST=cyan
AGKOZAK_COLORS_PATH=magenta

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

#For when you forget to cd
setopt AUTO_CD

#deactivate case-sensitive globbing default
unsetopt CASE_GLOB

#Formats history entries more nicely
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
#verify history-substituted command before running
setopt HIST_VERIFY

#allows the user to cycle through autocomplete options by continuing to press the autocomplete button
setopt MENU_COMPLETE

#setting aliases
alias cl='clear'
alias back='. back'
alias dockerd='open -a docker'
alias gs="git status"

bindkey '^P' go-parent
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

autoload -U compinit
compinit

###STOLEN FROM UBUNTU
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
###

#Setting colourised ls output
export CLICOLOR=1
LS_COLORS='no=00;37:fi=00:di=00;33:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
zstyle ':completion:*' list-colors 'di=1;36:ln=1;35:so=1;31:pi=1;33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

# Adding parts of path manually
# Setting PATH for Python 3.6 The original version is saved in .bash_profile.pysave
PATH="/usr/local/opt/ruby/bin:/usr/local/:~/.scripts:$HOME/.rvm/bin:$PATH"

case ":$PATH:" in
  *":$new_path:"*) :;; # already there
  *) PATH="$new_path:$PATH";; # or PATH="$PATH:$new_entry"
esac

#function to unpack all files in a child directory of the cwd to the cwd and then remove the directory
collapse(){
	mv $1/* $1/../
	rmdir $1
}

dockec(){
	docker exec -it "$DOCK" sh -c "$1"
}

dockont(){
	results=$(docker ps | grep $1 | awk '{ print $1 }' |  head -n 1)
	[ ! -z "$results" ] && export DOCK=$results
}

pushtoenv() {
	# $3 must be a brace-expandable array of values
	for env in $3; do
		scp $1 summit-$2-$env:/tmp;
	done
}

#adding a directory for search to the function definition files path
PATH=$ZDOTDIR:$PATH

if [ -f ~/.vars ]; then
	. ~/.vars;
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases;
fi

autoload bashcompinit
bashcompinit

if [ -z $INITIAL_LOGIN ]
then
	export INITIAL_LOGIN=1;
	. ~/.startup;
fi


# Add init line for rvm
. ~/.rvm/scripts/rvm
