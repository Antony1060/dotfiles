#
# ~/.bash_profile
#

if [[ -z "$DESKTOP" ]] && [[ "$(tty)" == "/dev/tty1" ]]; then
	exec startx
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
export GPG_TTY=$(tty)
