# =============================================================================
# 1. Powerlevel10k Instant Prompt (DEBE IR AL PRINCIPIO)
# =============================================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =============================================================================
# 2. Configuración Global de Zsh
# =============================================================================
# Desactiva el auto-título estándar de Zsh/Oh-My-Zsh
DISABLE_AUTO_TITLE="true"

# Configuración del historial
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
# 3. Zinit - Gestor de Plugins
# =============================================================================
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Cargar Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Cargar Plugins adicionales
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab 

# =============================================================================
# 4. Configuración de Powerlevel10k y FIX PARA TMUX
# =============================================================================
# Cargar archivo de configuración de p10k si existe
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --- [CRÍTICO] BLOQUEO DE RENOMBRADO DE VENTANAS ---
typeset -g POWERLEVEL9K_TERM_SHELL_TITLE=false
typeset -g POWERLEVEL9K_RESTORE_TERMINAL_TITLE_ON_EXIT=false
# ---------------------------------------------------

# =============================================================================
# 5. Completado y Estilos
# =============================================================================
autoload -U compinit && compinit

# Estilo de autocompletado y colores
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

# Completado no sensible a mayúsculas
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no 

# =============================================================================
# 6. Keybindings (Atajos de teclado)
# =============================================================================
bindkey '^z' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# =============================================================================
# 7. Integraciones y Variables de Entorno
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

# Cargar variables locales extra si existen
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# =============================================================================
# 8. Aliases
# =============================================================================
alias ls='ls --color'
alias vim='nvim'
alias v='nvim'
alias ollama_serve="sudo service ollama stop && ollama serve"
alias av="source .venv/bin/activate "
alias bpill="cmatrix -C cyan -u 9 -B -s"
alias bonsai="cbonsai -l -m ' Javier says Hi!'"
alias ecs="nvim ~/etc/cheatsheet.md"
alias ezsh="nvim ~/.zshrc"
alias fv='nvim $(fzf --preview="batcat --color=always {}")'
alias tmuxg='ghostty -e tmux'
alias ralph="gemini -s --yolo"
alias eghsty="nvim ~/.config/ghostty/config"

# Git aliases
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

# opencode
export PATH=/home/jmatas/.opencode/bin:$PATH

# bun completions
[ -s "/home/jmatas/.bun/_bun" ] && source "/home/jmatas/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
