# =============================================================================
# 1. Powerlevel10k Instant Prompt 
# =============================================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =============================================================================
# 2. Global ZSH
# =============================================================================
DISABLE_AUTO_TITLE="true"
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt append_history
setopt sharehistory
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups 

# =============================================================================
# 3. Zinit
# =============================================================================
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab 

# =============================================================================
# 4. Powerlevel10k and FIX TMUX
# =============================================================================
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_TERM_SHELL_TITLE=false
typeset -g POWERLEVEL9K_RESTORE_TERMINAL_TITLE_ON_EXIT=false

# =============================================================================
# 5. Styles
# =============================================================================
autoload -U compinit && compinit

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#939ab7,bold"
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#8aadf4,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=#8bd5ca,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#8bd5ca,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#8bd5ca,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=#8bd5ca,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#8bd5ca,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=#bfffe6'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#bfffe6,underline'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#a6da95'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#a6da95'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#eed49f'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#eed49f'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ed8796,bold'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#585b70'

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no 

# =============================================================================
# 6. Keybindings 
# =============================================================================
bindkey '^z' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# =============================================================================
# 7. Env Vars
# =============================================================================
# FZF Integration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

# Homebrew (Linuxbrew)
if [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# PATH export
export PATH="/snap/bin:$PATH"

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# =============================================================================
# 8. Aliases
# =============================================================================
alias ls='ls --color'
alias vim='nvim'
alias v='nvim'
alias av="source .venv/bin/activate "
alias bpill="cmatrix -C cyan -u 9 -B -s"
alias bonsai="cbonsai -l -m ' Javier says Hi!'"
alias ecs="nvim ~/etc/cheatsheet.md"
alias ezsh="nvim ~/.zshrc"
alias fv='nvim $(fzf --preview="batcat --color=always {}")'
alias tmuxg='ghostty -e tmux'

# opencode
export PATH=/home/jmatas/.opencode/bin:$PATH

# bun completions
[ -s "/home/jmatas/.bun/_bun" ] && source "/home/jmatas/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
