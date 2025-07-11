# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Load 10k prompt 
zinit ice depth=1;zinit light romkatv/powerlevel10k

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab 

# Load completions 
autoload -U compinit && compinit

# Color autopcompletion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#939ab7,bold"
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#8aadf4,bold'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey '^z' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History of commands
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

# Non case-sensitive completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no 

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias ollama_serve="sudo service ollama stop && ollama serve"
alias activate="source .venv/bin/activate "
alias bpill="cmatrix -C cyan -u 9 -B -s"
alias bonsai="cbonsai -l -m ' Javier says Hi!'"
alias e_cs="nvim ~/etc/cheatsheet.txt"
alias e_zsh="nvim ~/.zshrc"
alias dev_env="cd $HOME/etc && ./tmux.sh"
alias fv='nvim $(fzf --preview="batcat --color=always {}")'
alias tmuxg='ghostty -e tmux'

# Eval integrations
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source <(fzf --zsh)

export PATH="/snap/bin:$PATH"

. "$HOME/.local/bin/env"
