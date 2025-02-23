# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoredup

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=20000
HISTFILESIZE=40000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
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

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#ALIASES

alias awsCustomerDevCli='navify-aws-sso-login --username cortescc --login-role-arn arn:aws:iam::370516466271:role/Roche/Products/EPC/EPCDevOps --write-credentials RocheCustomerFake && export AWS_PROFILE=RocheCustomerDev'
alias awsCustomerDevWeb='navify-aws-sso-login --username cortescc --login-role-arn arn:aws:iam::370516466271:role/Roche/Products/EPC/EPCDevOps --get-admin-console-url'
alias awsDevCli='navify-aws-sso-login --username cortescc --login-role-arn arn:aws:iam::999061576626:role/Roche/Products/EPC/EPCDevOps --write-credentials RocheDev && export AWS_PROFILE=RocheDev'
alias awsDevWeb='navify-aws-sso-login --username cortescc --login-role-arn arn:aws:iam::999061576626:role/Roche/Products/EPC/EPCDevOps --get-admin-console-url'
alias awsSandCli='navify-aws-sso-login --username cortescc --login-role-arn arn:aws:iam::539394064815:role/Roche/Products/EPC/EPCDevOps --write-credentials RocheSandbox && export AWS_PROFILE=RocheSandbox'
alias awsSandWeb='navify-aws-sso-login --username cortescc --login-role-arn arn:aws:iam::539394064815:role/Roche/Products/EPC/EPCDevOps --get-admin-console-url'
alias awsQaCli='navify-aws-sso-login --username cortescc --login-role-arn arn:aws:iam::268202787656:role/Roche/Products/EPC/EPCDevOps --write-credentials RocheQA && export AWS_PROFILE=RocheQA'
alias awsQaWeb='navify-aws-sso-login --username cortescc --login-role-arn arn:aws:iam::268202787656:role/Roche/Products/EPC/EPCDevOps --get-admin-console-url'
alias awsProdCli='navify-aws-sso-login --username cortescc --login-role-arn arn:aws:iam::746925329889:role/Roche/Products/EPC/EPCDevOps --write-credentials RocheProd && export AWS_PROFILE=RocheProd'
alias awsStageCli='navify-aws-sso-login --username cortescc --login-role-arn arn:aws:iam::162957762240:role/Roche/Products/EPC/EPCDevOps --write-credentials RocheStage && export AWS_PROFILE=RocheStage'
alias awsNetwork='navify-aws-sso-login --username cortescc --login-role-arn arn:aws:iam::737414759265:role/Roche/Products/EPC/EPCDevOps --write-credentials RocheNetwork && export AWS_PROFILE=RocheNetwork'

#alias pulse='/opt/pulsesecure/bin/pulselauncher -U rbapulse.range.roche.net/rlcaas-cert -r EMEA -c ~/.pulsesecure/pulse/certificates/$USER.pem -u $USER'

alias vim=nvim

alias mocp='mocp -T nightly_enhanced'

#KUBERNETES AUTOCOMPLETION

alias k=kubecolor
source <(kubectl completion bash)
complete -o default -F __start_kubectl k
export KUBE_EDITOR=nvim

# Starship
eval "$(starship init bash)"

# ADD .local/bin to $PATH
export PATH=$PATH:$HOME/.local/bin:$HOME/.krew/bin:$HOME/go/bin

# Flux Autocompletion
command -v flux >/dev/null && . <(flux completion bash)

# SSH Agent
eval "$(ssh-agent)"

neofetch
