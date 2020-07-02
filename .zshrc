fpath+=$HOME/.zsh/pure

autoload -U promptinit; promptinit
prompt pure

zstyle :prompt:pure:git:stash show yes

export ZSH="$HOME/.zsh"

source $ZSH/custom/greet.sh
source $ZSH/custom/keys.sh

export VISUAL=vim
export EDITOR="$VISUAL"

# IN-CASESENSITIVE COMMAND SEARCHING
CASE_SENSITIVE="false"

# AUTO COMMAND CORRECTION
ENABLE_CORRECTION="true"

# HISTORY
SAVEHIST=100
HISTSIZE=50

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Applications/google-cloud-sdk/path.zsh.inc' ]; then . '/Applications/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Applications/google-cloud-sdk/completion.zsh.inc' ]; then . '/Applications/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm



# FUZZY HISTORY CMD SEARCHING [ARR-UP]
if [[ "${terminfo[kcuu1]}" != "" ]]; then
	autoload -U up-line-or-beginning-search
	zle -N up-line-or-beginning-search
	bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# FUZZY HISTORY CMD SEARCHING [ARR-UP]
if [[ "${terminfo[kcud1]}" != "" ]]; then
	autoload -U down-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# CUSTOM CD (CD & LS)
ccd() {
	cd $1;
    if [ $? -eq 0 ]; then
	    ls;
    fi
}
alias cd="ccd"

# CUSTOM MKDIR (MKDIR & CD)
mkcd() {
	mkdir $1;
	cd $1;
}
alias mkdir="mkcd"

pullall() {
    echo "Pulling all git subdirectories.."
    ls | xargs -P10 -I{} git -C {} pull
}

# GOOGLE FUNCTION
function google() {
    all=""
    for var in "$@"
    do
        all=($all $var)
    done
	open "http://www.google.com/search?q=$all" &;
}

# MOV TO GIF FUNCTION
function togif() {
    ffmpeg -i $1 -pix_fmt rgb8 -r 10 $1.gif && gifsicle -O3 $1.gif -o $1.gif
}

# CD UP SCRIPT
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../../"
alias .....="cd ../../../.."

alias lsa="ls -al"
alias rmr="rm -r"
alias rmrf="rm -rf"
alias cpr="cp -r"
alias cprf="cp -rf"
alias c="clear"

# Git Aliases
alias g="git"
alias gs="git status"
alias gp="git push"
alias gpa="git push --all"
alias gpu="git pull"
alias gpua="git pull --all"
alias gc="git commit -m"
alias ga="git add"
alias gaa="git add --all"
alias gch="git checkout"
alias gcb="git checkout -b"
alias gl="git log"
alias gst="git stash"
alias gsp="git stash pop"
alias grmc="git rm -r --cached . && git add . && git commit -am 'Remove ignored files'"
alias gitdriveby='git add --all; git commit -m "$(curl -s http://whatthecommit.com/index.txt )"; git push'
alias gi='git rm -r --cached . && git add . && git commit -m "fixed untracked files"'
