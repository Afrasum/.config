# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ---- History setup -----
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999

# Del historikk mellom shells og håndter duplikater
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
setopt HIST_IGNORE_ALL_DUPS

# Substring-søk i historikk (↑/↓ hopper gjennom kommandoer som inneholder teksten)
if [ -f /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
  source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
fi

# Bind ↑/↓ til substring-søk
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


# ---- Autocompletion og highlighting -----
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# ---- Eza (better ls) -----
alias ls="eza --icons=always"
alias ls='eza -1 --icons=always'

# ---- Zoxide (better cd) -----
eval "$(zoxide init zsh)"
alias cd="z"


# ---- pyenv ----
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"


eval "$(pyenv virtualenv-init -)"
