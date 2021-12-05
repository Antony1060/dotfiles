#
# ~/.bash_profile
#

if [[ -z "$DESKTOP" ]] && [[ "$(tty)" == "/dev/tty1" ]]; then
	exec startx
fi

if [[ "$(tty)" == /dev/tty* ]]; then
	sudo loadkeys croat
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
export GPG_TTY=$(tty)
