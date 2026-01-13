# pywall colors
(cat ~/.cache/wal/sequences &)

# fastfetch template
if [[ -o interactive ]]; then
    # fastfetch --config examples/12
    fastfetch
fi
#################################################################
# PATH
export PATH=$HOME/bin:/usr/local/bin:/snap/bin:/opt/bin:$PATH

# PLUGINS DIR
export PLUGINS=/usr/share/zsh/plugins

# History file location
export HISTFILE=~/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=3000

# How many commands history will save on file.
export SAVEHIST=3000

# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS

# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS

# CACHE
ZSH_CACHE_DIR=$HOME/.cache/zsh
#################################################################

# plugins
source $PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $PLUGINS/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# disable underline for syntax highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# ALIASES
alias cleanup='~/.local/share/cinnamon/my-scripts/cleanup.sh'
alias update-all='~/.local/share/cinnamon/my-scripts/update-all.sh'
alias set-theme='~/.local/share/cinnamon/my-scripts/set-theme.sh'
alias home='cd ~'
alias hh='cd ~'
alias lsa='ls -lah --color=auto --group-directories-first'
alias l='ls -lah --color=auto --group-directories-first'
alias ll='ls -lh --color=auto --group-directories-first'
alias la='ls -lAh --color=auto --group-directories-first'

# enable delete key
bindkey "^[[3~" delete-char

# load starship last
eval "$(starship init zsh)"
