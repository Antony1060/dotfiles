#
# ~/.bash_profile
#

if [[ -z "$DESKTOP" ]] && [[ "$(tty)" == "/dev/tty1" ]]; then
	exec startx
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
export GPG_TTY=$(tty)

# uncomment if you're me on my main PC
# bash -c "~/.local/bin/firefox-sync.sh bgq2excs.default-release > /dev/null &"
