# =============================================================================
# 1. Powerlevel10k Instant Prompt (must stay near top)
# =============================================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =============================================================================
# 2. Global ZSH options
# =============================================================================
# Disable Zsh/Oh-My-Zsh auto-title
DISABLE_AUTO_TITLE="true"

# History
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
# 3. PATH
# =============================================================================
export BUN_INSTALL="$HOME/.bun"
export PATH="/snap/bin:$HOME/.opencode/bin:$BUN_INSTALL/bin:$PATH"

# Homebrew (Linuxbrew)
if [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Local env file
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# =============================================================================
# 4. Zinit plugin manager
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
# 5. Powerlevel10k config + tmux title fix
# =============================================================================
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Block window renaming (tmux)
typeset -g POWERLEVEL9K_TERM_SHELL_TITLE=false
typeset -g POWERLEVEL9K_RESTORE_TERMINAL_TITLE_ON_EXIT=false

# =============================================================================
# 6. Completion + styles
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

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no

# =============================================================================
# 7. Keybindings
# =============================================================================
bindkey '^z' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# =============================================================================
# 8. Integrations
# =============================================================================
# fzf
source <(fzf --zsh)

# bun completions
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# SSH agent: auto-start and load key once per session
if [ -z "$SSH_AUTH_SOCK" ]; then
   eval "$(ssh-agent -s)" > /dev/null
   ssh-add ~/.ssh/id_ed25519 2>/dev/null
fi

# =============================================================================
# 9. Aliases
# =============================================================================
alias ls='ls --color=auto'
alias vim='nvim'
alias v='nvim'
alias ollama_serve="sudo service ollama stop && ollama serve"
alias av="source .venv/bin/activate"
alias bpill="cmatrix -C cyan -u 9 -B -s"
alias bonsai="cbonsai -l -m ' Javier says Hi!'"
alias ecs="nvim ~/etc/cheatsheet.md"
alias ezsh="nvim ~/.zshrc"
alias fv='nvim $(fzf --preview="batcat --color=always {}")'
alias tmuxg='ghostty -e tmux'
alias ralph="gemini -s --yolo"
alias eghsty="nvim ~/.config/ghostty/config"

# Git
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gca='git commit -am'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gd='git diff'
alias gds='git diff --staged'
alias gp='git push'
alias gpl='git pull'
alias gf='git fetch'
alias gl='git log --oneline --graph --decorate --all'
alias gst='git stash'
alias gstp='git stash pop'
alias grs='git restore --staged'
