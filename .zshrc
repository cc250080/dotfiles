# PROMPT PERSONALITZAT

# Carregar les funcions necessàries
autoload -Uz promptinit vcs_info
vcs_info
promptinit

# Configurar VCS info (git)
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats ' (%b)'  # mostra la rama
zstyle ':vcs_info:*' actionformats ' (%b|%a)'

# Precmd s'executa abans de cada prompt
precmd () {
    vcs_info

     # Detectar git status
    local git_status=""
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        if [[ -n $(git status -s) ]]; then
            # Repo amb canvis sense cometre
            git_status=" 🔧"
        elif ! git diff-index --quiet --cached HEAD -- >/dev/null 2>&1; then
            # Canvis staged (! inverteix la lògica)
            git_status=" 📦"
        else
            # Repo net
            git_status=" ✨"
        fi
    fi
    PS1="%B%F{cyan}%n%f%F{green}@%m%f%F{blue}:%~%f%F{magenta}${vcs_info_msg_0_}${git_status}%f%b %# "
}

# Definir els colors
local user_color="%F{cyan}"
local host_color="%F{green}"
local path_color="%F{blue}"
local git_color="%F{magenta}"
local reset="%f"
local bold="%B"
local nobold="%b"

# Construir el prompt
PS1="%B%F{cyan}%n%f%F{green}@%m%f%F{blue}:%~%f${vcs_info_msg_0_}%b %# "
# =============================================================================


# History: don't record duplicates, share history between shells
setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi, ctrl+A ctrl+E
bindkey -e

# Keep 5000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# COMMON ALIAS
# Alias comuns
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lah'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias vi=nvim
alias vim=nvim
alias k=kubecolor

# PATH
export PATH="$HOME/.local/bin:$PATH"

# EXECUTE AL INICI
fastfetch
