# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
export PATH="/usr/local/bin:$PATH"
alias xcode="open -a /Developer/Applications/Xcode.app"
alias pylab="/Library/Frameworks/EPD64.framework/Versions/Current/bin/ipython --pylab"
alias epd_python="/Library/Frameworks/EPD64.framework/Versions/Current/bin/python"
alias epd_easy_install="/Library/Frameworks/EPD64.framework/Versions/Current/bin/easy_install"
alias xcode="open -a /Developer/Applications/Xcode.app"
alias smultron="open -a /Applications/Smultron.app"
alias code="open -a /Applications/CodeRunner.app"
alias isquint="/Applications/iSquint.app/Contents/Resources/ffmpeg"
#alias gnuplot="/Applications/Gnuplot.app/Contents/Resources/bin/gnuplot"
alias maplemac="/Library/Frameworks/Maple.framework/Versions/Current/bin/maple"
#alias octave="/Applications/Octave.app/Contents/Resources/bin/octave"
function setepd {
	export PATH="/Library/Frameworks/EPD64.framework/Versions/Current/bin/:$PATH"
}
function FinderDir {
	return `osascript -e "tell application \"Finder\" to if window 1 exists then if target of window 1 as string is not \":\" then get POSIX path of (target of window 1 as alias)"`
}
alias cdf='cd `osascript -e "tell application \"Finder\" to if window 1 exists then if target of window 1 as string is not \":\" then get POSIX path of (target of window 1 as alias)"`'
export LD_LIBRARY_PATH=/usr/local/lib
export DVHOST=ubuntu.local

function l2norm {
	name=${1%\.*}
	procsdf ${name}.sdf . 0 0 0 > ${name}.txt
}

function spotfile {
	mdfind "$1" | grep "$1"
}

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

. ~/.bash_colours

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#if [ "$color_prompt" = yes ]; then
	PS1="\`if [ \$? = 0 ]; then echo ^_^; else echo -_-; fi\` \[${NORMAL}\] \[${GREEN}\]\h\[${BLUE}\] \W \[${RED}\]\$ \[${NORMAL}\]"
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
cd
export CLICOLOR=1

# @gf3’s Sexy Bash Prompt, inspired by "Extravagant Zsh Prompt"
# Shamelessly copied from https://github.com/gf3/dotfiles

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
    tput sgr0
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
          MAGENTA=$(tput setaf 9)
          ORANGE=$(tput setaf 172)
          GREEN=$(tput setaf 190)
          PURPLE=$(tput setaf 141)
          WHITE=$(tput setaf 256)
    else
          MAGENTA=$(tput setaf 5)
          ORANGE=$(tput setaf 4)
          GREEN=$(tput setaf 2)
          PURPLE=$(tput setaf 1)
          WHITE=$(tput setaf 7)
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    PURPLE="\033[1;35m"
    WHITE="\033[1;37m"
    BOLD=""
    RESET="\033[m"
fi

parse_git_dirty () {
      [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
parse_git_branch () {
	  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]at \[$ORANGE\]\h \[$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n\$ \[$RESET\]"

set completion-ignore-case on
set mark-symlinked-directories on
set show-all-if-ambiguous on

##
# Your previous /Users/mbarriault/.bash_profile file was backed up as /Users/mbarriault/.bash_profile.macports-saved_2011-07-21_at_11:01:51
##

# MacPorts Installer addition on 2011-07-21_at_11:01:51: adding an appropriate PATH variable for use with MacPorts.
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.



##
# Your previous /Users/mbarriault/.bash_profile file was backed up as /Users/mbarriault/.bash_profile.macports-saved_2011-08-09_at_13:19:14
##

# MacPorts Installer addition on 2011-08-09_at_13:19:14: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$HOME/usr/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# Setting PATH for EPD-7.1-2
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/EPD64.framework/Versions/Current/bin:${PATH}"
#export PATH

MKL_NUM_THREADS=1
export MKL_NUM_THREADS

PATH="$HOME/libmesh/bin:$PATH"
export PATH
