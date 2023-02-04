#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

stty -ixon

export LC_ALL=en_US.UTF-8
export LC_CTYPE=hr_HR.UTF-8

alias watch='watch '

alias ls='ls -A --color=auto'
alias ll='ls -lah'
alias grep='grep --color=auto'

# Aaaaaa, don't question it please
alias luyten="_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on' java -jar /home/antony/Downloads/luyten-0.5.4.jar &"

alias java8="/usr/lib/jvm/java-8-openjdk/bin/java"
alias codehere="code . && exit"

alias k=kubectl
alias y=yarn
alias p=pnpm

alias pcs="curl https://media.antony.red/sample.cpp > "
alias pcms="curl https://media.antony.red/sampleMulti.cpp > "

alias clip="xclip -selection clip"

function luytene {
    luyten
    exit
}

function cdl {
    cd $1 && ls
}

function mkcd {
    mkdir $1 && cd $1
}

CODING_FOLDER="/home/antony/Desktop/Coding/"
CODING_EXCLUDE_DIRS=("! -path /*.git/*" "! -path /*node_modules/*" "! -path /*python2.7/*" "! -path /*python3.6/*" "! -path /*__pycache__/*")
function coding {
	DIRS=$(find $CODING_FOLDER -maxdepth 2 -type d ${CODING_EXCLUDE_DIRS[@]} | sed "s|$CODING_FOLDER||g")
    DIR=$(echo -e "--root-- $DIRS" | fzf --reverse)
	if [[ ${#DIR} -ne 0 ]]; then
        if [[ "$DIR" == "--root-- " ]]; then
            DIR="."
        fi
		cd "$CODING_FOLDER$DIR"
		echo -e '\e[94m======================================\e[0m\n\n    Going to \e[36m'$DIR'\e[39m\n\n\e[94m======================================'
	fi
}

function fzhdd {
    DIR=$(find /hdd -maxdepth 3 -type d | fzf --reverse)
    if [[ ${#DIR} -ne 0 ]]; then
        cd "$DIR"
        echo "In $DIR"
    fi
}

alias jcode="cd /home/antony/Desktop/Coding/Java"
alias jscode="cd /home/antony/Desktop/Coding/Js"

function paci {
    sudo pacman -S $*
}

function pacrem {
    sudo pacman -R $*
}
   
function pacins {
    sudo pacman -Syu && sudo pacman -S $*
}

function aur {
	PREV=$(pwd)
    cd ~/AURs
    for package in "$@"
        do
	    git clone https://aur.archlinux.org/$package.git
	    cd $package
        makepkg -s -i
        cd ..
        rm -rf $package
    done
    cd $PREV
}

function git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/' -e 's/* //' | xargs printf 2> /dev/null
    if [[ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" == "true" ]]; then
	    echo -e " "
    fi
}

function last_startup_time() {
    firmware=$(systemd-analyze | head -n 1 | cut -d ' ' -f 4 | cut -d 's' -f 1)
    total_seconds=$(systemd-analyze | head -n 1 | cut -d '=' -f 2 | xargs | sed -E "s/\.[0-9]+//g; s/s$/sec/; s/^/1970-01-01 00:00:00 UTC +/; s/[0-9]+msec//g" | date -f- +%s)
    after_firmware=$(echo "$(echo "($total_seconds - $firmware) / 60" | bc)min $(echo "($total_seconds - $firmware)" % 60 | bc)s" | sed -E 's/^0min //g')
    echo -n "$after_firmware (+${firmware}s firmware)"
}

# just for fancy printing if I ever wanted to find this while using the shell normally
function starttime() {
    echo -e "\e[94m\e[1mLast startup time \e[93m⚡\e[92m\e[1m$(last_startup_time)\e[00m"
}

PS1='\[\e[92m\]$(git_branch)\[\e[93m\]\[\e[1m\]\[\e[03m\]\u\[\e[0m\]\[\e[1m\]@\[\e[92m\]\[\e[1m\]localhost \[\e[00m\]\[\e[01m\]\w\[\e[90m\]\[\e[00m\] \$ '

export PATH="$(yarn global bin):$PATH"
export BUN_INSTALL="/home/antony/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export MAKEFLAGS="-j $(grep -c ^processor /proc/cpuinfo)"

# ikik, shut up, please
eval $(gnome-keyring-daemon --start 2> /dev/null)
export SSH_AUTH_SOCK

source /usr/share/fzf/key-bindings.bash
source /usr/share/nvm/init-nvm.sh

echo
echo
neofetch
starttime
. "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="/home/antony/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
