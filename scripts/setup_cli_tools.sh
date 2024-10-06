#!/bin/bash

# starship prompt
eval "$(starship init bash)"

# setup fzf
# eval "$(fzf --bash)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# ----- Bat (better cat) -----
export BAT_CONFIG_PATH="$HOME/dotfiles/bat/bat.conf"
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
