# PATH Configuration

path=(
  $HOME/.local/bin
  $path
)

typeset -U path
path=($^path(N-/))

eval "$($HOME/.local/bin/mise activate zsh)" # activate mise

# History

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE # dont save when prefixed with space
setopt HIST_IGNORE_DUPS # dont save duplicate lines
setopt SHARE_HISTORY # share history between sessions

# Prompt
fpath+=(
  ~/.zsh/prompts
) # Tell Zsh where to look for custom prompt themes

autoload -Uz promptinit 
promptinit 
prompt simple
setopt prompt_subst

# Environment variables

export TERM="screen-256color"
export UV_PROJECT_ENVIRONMENT="$HOME/.venv"
export EDITOR=nvim
export VISUAL=nvim
export LSCOLORS='gxfxcxdxbxegedabagacad'
LANG=C.UTF-8
DOTFILES=~/dotfiles

# Force the Zsh command line interface to use Emacs keybindings 
# This overrides Zsh's automatic switch to Vi mode caused by export variables above
bindkey -e

# Aliases

alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lah'
alias v='nvim'
alias dotfiles='cd $DOTFILES'

# Completions

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
