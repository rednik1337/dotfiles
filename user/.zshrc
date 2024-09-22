ZSH_AUTOSUGGEST_MANUAL_REBIND=1

### Theme
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/Repos/zsh-plugins/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet


### Plugins
ZVM_INIT_MODE=sourcing
source ~/Repos/zsh-plugins/fzf-tab/fzf-tab.plugin.zsh
fpath=(~/Repos/zsh-plugins/zsh-completions $fpath)
source ~/Repos/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/Repos/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/Repos/zsh-plugins/zsh-auto-notify-hyprland/auto-notify.plugin.zsh
source ~/Repos/zsh-plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

autoload -Uz compinit && compinit


### Options
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase
setopt appendhistory
#setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt correct 
#export KEYTIMEOUT=1


### Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:*:*' fzf-preview '~/Scripts/fzf-tab-preview.sh ${(Q)realpath}'

# arguments
zstyle ':fzf-tab:complete:*:options' fzf-preview 
zstyle ':fzf-tab:complete:*:argument-1' fzf-preview

# descriptions
zstyle ':completion:*:descriptions' format '[%d]'

# kill
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

# systemd unit status
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# enviroment variables
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'

# git
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview	'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview 'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview 'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
	'case "$group" in
	"commit tag") git show --color=always $word ;;
	*) git show --color=always $word | delta ;;
	esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
	'case "$group" in
	"modified file") git diff $word | delta ;;
	"recent commit object name") git show --color=always $word | delta ;;
	*) git log --color=always $word ;;
	esac'

# tldr
zstyle ':fzf-tab:complete:tldr:argument-1' fzf-preview 'tldr --color always $word'


### Binds
bindkey "^j" down-line-or-history
bindkey "^k" up-line-or-history
bindkey "^l" autosuggest-accept

### Aliases
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='eza'
alias la='eza -lah --icons --git'
alias nv='nvim'
alias py='python'
alias z='zeditor'
alias y='yazi'
alias c='clear'
alias gc='git clone'

alias changewal='~/Scripts/wall/changewal.sh'


### Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"


### Fortune
#fortune -s
#echo 
