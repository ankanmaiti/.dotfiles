# Lang (support for unicode)
export LANG=en_IN.utf8
export LC_ALL=en_IN.utf8
export LC_CTYPE=en_IN.utf8

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# starship prompt
eval "$(starship init bash)"

export NVM_DIR="$HOME/.nvm"                                                                                                                                                                                                               
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm                                                                                                                                                                        
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# setup fzf
eval "$(fzf --bash)"

# ----- Bat (better cat) -----
export BAT_THEME="Catppuccin Mocha"
alias cat="bat"

# ---- Eza (better ls) -----
alias ls="eza --oneline --icons --no-time --no-permissions --tree --level=1"

# fzf + eza + bat (+ tmux)
export FZF_DEFAULT_OPTS="--tmux 80% --layout reverse --border" # Open in tmux popup if on tmux
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# better cd with zoxide
eval "$(zoxide init bash)"
alias cd="z"
