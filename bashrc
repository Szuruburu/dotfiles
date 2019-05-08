# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If user ID is greater than or equal to 1000 & if ~/bin exists and is a directory & if ~/bin is not already in your $PATH
# then export ~/bin to your $PATH.
if [[ $UID -ge 1000 && -d $HOME/bin && -z $(echo $PATH | grep -o $HOME/bin) ]]
then
	export PATH="${PATH}:$HOME/bin"
fi

# Fix delete button in st terminal
tput smkx

# enable control-s and control-q
vim() {
    local ret STTYOPTS="$(stty -g)"
    stty -ixon
    command vim "$@"
    ret=$?
    stty "$STTYOPTS"
    return "$ret"
}

# Set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Colored man pages
man() {
	LESS_TERMCAP_md=$'\e[01;31m' \
	LESS_TERMCAP_me=$'\e[0m' \
	LESS_TERMCAP_se=$'\e[0m' \
	LESS_TERMCAP_so=$'\e[01;44;33m' \
	LESS_TERMCAP_ue=$'\e[0m' \
	LESS_TERMCAP_us=$'\e[01;32m' \
	command man "$@"
}

function ttp() {
	enabled="$(tput setaf 4)$(tput setab 0) TouchPad is now enabled $(tput sgr 0)\n"
	disabled="$(tput setaf 8)$(tput setab 0) TouchPad is now disabled $(tput sgr 0)\n"
	status="$(xinput --list-props 13 | awk '/Device Enabled/{print $4}')"
	TPID="$(xinput | awk '/TouchPad/{print $6}' | cut -d '=' -f 2)"
	if [ "$status" = 0 ]; then
		xinput enable $TPID
		#UCPID="$(pidof unclutter)"
		#kill SIGTERM $UCPID
		echo -ne $enabled
	else
		#unclutter -idle 0 &
		xinput disable $TPID
		echo -ne $disabled
	fi
}

function tts() {
	enabled="$(tput setaf 4)$(tput setab 0) TouchScreen is now enabled $(tput sgr 0)\n"
	disabled="$(tput setaf 8)$(tput setab 0) TouchScreen is now disabled $(tput sgr 0)\n"
	status="$(xinput --list-props 10 | awk '/Device Enabled/{print $4}')"
	TSID="$(xinput | awk '/eGalaxTouch/{print $7}' | cut -d '=' -f 2)"
	if [ "$status" = 0 ]; then
		xinput enable $TSID
		echo -ne $enabled
	else
		xinput disable $TSID
		echo -ne $disabled
	fi
}

function acat {
	endtext="$(tput setaf 4)$(tput setab 0) -------------------- a cat ends here -------------------- $(tput sgr 0)\n"
	starttext="$(tput setaf 4)$(tput setab 0) -------------------- a cat starts here -------------------- $(tput sgr 0)\n"
	echo -ne $starttext
	pygmentize -g "$1"
	echo -ne $endtext
}

function restartplasma {
	kquitapp5 plasmashell && plasmashell
}

function findfolder {
	find ~ -name "$1" -type d
}

function findfile {
	 find ~ -name "$1" -type f
}

export -f ttp
export -f tts
export -f acat
export -f restartplasma
export -f findfolder
export -f findfile

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

alias bright='xrandr --output HDMI-1 --brightness'
alias ls='exa --group-directories-first'
alias ll='exa --group-directories-first -lgh'
alias llfn='exa -1'
alias la='exa --group-directories-first -a'
alias lla='exa --group-directories-first -la'
alias laa='exa --group-directories-first -d .?*'
alias llaa='exa --group-directories-first -ld .?*'
alias lg="exa -lagh --git"
# alias llfn='for n in *; do printf "%s\n" "$n"; done'
# alias la='ls -as'
# alias lla='ls -las'
# alias laa='ls -d .?*'
# alias llaa='ls -ld .?*'
# alias ls='ls --group-directories-first --color=always'
alias dir='-as --group-directories-first --color=always'
alias cls='clear'
alias diff='diff --color=auto'
#alias grep='grep --color=auto'

alias cpbashrc='/home/szuruburu/Scripts/cpbashrc.sh'
alias reboot!='sudo reboot -f'
#alias ping='prettyping'
alias notepad='kate &'
alias cd..='cd ..'
alias paint='kolourpaint %u &'
alias cclip='xclip -selection clipboard'
alias clipp='xclip -selection clipboard -o'

alias sysupdate='yay --nodiffmenu -Syu'
alias cm='cmatrix -b -C cyan'

# Github
alias gitstore='git config --global credential.helper "store --file ~/.my-credentials"'

# Vim
# Suppress output from the 'fg' command
alias fg='fg &> /dev/null'

# PAC
# install
alias pac='yay --nodiffmenu -S'
# uninstall
alias upac='yay -Rns'
# clean
alias cpac='yay -Yc'
# version
alias vpac='yay -Qi'
# stats
alias statpac='yay -Ps'
# list all pacs
alias lspac='expac -H M "%m\t%n" | sort -h'

# DEVICE
alias lsdev='inxi -Fx'
alias lsgpu='inxi -G'
alias lsmonitors='for p in /sys/class/drm/*/status; do con=${p%/status}; echo -n "${con#*/card?-}: "; cat $p; done'

# Utils
alias clock='tty-clock -cs'

#PS1='\[\e[36m\][$(date +%H:%M)]\[\e[0m\] \W\$ '

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh

##PS1='[\[\e[1;31m\]\u\[\e[0m\]@\[\e[36m\]\h\[\e[0m\] \W]\$ '
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

