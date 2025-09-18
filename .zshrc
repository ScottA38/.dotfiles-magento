#Set prompt library
#source $ZDOTDIR/agkozak-zsh-prompt/agkozak-zsh-prompt.plugin.zsh
local fpath;

# Set prompt config
AGKOZAK_MULTILINE=0
AGKOZAK_LEFT_PROMPT_ONLY=1
AGKOZAK_COLORS_USER_HOST=cyan
AGKOZAK_COLORS_PATH=magenta

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

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

# Custom keyboard shortcuts (?)
bindkey '^P' go-parent
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

autoload -U compinit
compinit

#setting directory shortcuts
hash -d dev="/home/scotta/dev"
hash -d proj="/home/scotta/Projects"
hash -d freelance="~/Documents/Scott\ A\ Dev"

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#Setting colourised ls output
export CLICOLOR=1
LSCOLORS='no=00;37:fi=00:di=00;33:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
zstyle ':completion:*' list-colors 'di=1;36:ln=1;35:so=1;31:pi=1;33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

#Iterate items to add and add if not already found
if [ -f "./path_additions.txt" ]; then
	while read add; do
  	echo $PATH | grep -q $add
  	if [[ $? -ne 0 ]]; then
    	PATH="$add:$PATH"
  	fi
	done < "./path_additions.txt"
fi

#adding a directory for search to the function definition files path
PATH=$ZDOTDIR:$PATH

if [ -f ~/.vars ]; then
	. ~/.vars;
fi

if [ -f $ZDOTDIR/.bash_aliases ];
	then
	. $ZDOTDIR/.bash_aliases;
elif [ -f ~/.bash_aliases ];
	then
	. ~/.bash_aliases;
fi

if [ -f  $ZDOTDIR/.zsh_functions ]; then
	source $ZDOTDIR/.zsh_functions
	fpath=( $ZDOTDIR/.zsh_functions "${fpath[@]}" )
	autoload -Uz ${fpath[1]}/*(:t)
fi

autoload bashcompinit
bashcompinit

# Add init line for rvm
#. ~/.rvm/scripts/rvm

# Add direnv hook
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"


#pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
