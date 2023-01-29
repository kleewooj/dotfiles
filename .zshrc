#####################
# ZSH configuration #
#####################
# pure prompt 
fpath+=/opt/homebrew/share/zsh/site-functions
autoload -U promptinit; promptinit
prompt pure
# auto suggestion like fish
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '$$' autosuggest-accept
# export CLICOLOR=1
# export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
# PROMPT='\[\e[32m\][\u@Macbook: \[\e[36m\]\W\[\e[32m\]]\[\e[0m\] '
# PROMPT='%F{cyan}%n%f:~$'
# PROMPT='%F{cyan}%n%f:~$'
export EDITOR='nvim'
# PATH
export PATH=$PATH:"/opt/homebrew/bin"
export PATH=$PATH:"$HOME/dotfiles"
export PATH=$PATH:"$HOME/dotfiles/bin"

# Note setup
export PATH=$PATH:"$HOME/notes"
export NOTES_DIR="$HOME/notes"

# Shell history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
setopt EXTENDED_HISTORY
SAVEHIST=5000
HISTSIZE=2000
# Set breakpoint() in Python to call pudb
alias python="python3"
export PYTHONBREAKPOINT="pudb.set_trace"

#####################
# fzf configuration #
#####################
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

fzf_find_in_file() {
    if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
    local file
    file="$(rga --max-count=1 --ignore-case --files-with-matches --no-messages "$*" | fzf-tmux +m --preview="rga \
    --ignore-case --pretty --context 10 '"$*"' {}")" && echo "opening $file" && open "$file" || return 1;
}
fzf_find_edit() {
    local file=$(
      fzf --query="$1" --no-multi --select-1 --exit-0 \
          --preview 'bat --color=always --line-range :500 {}'
      )
    if [[ -n $file ]]; then
        $EDITOR "$file"
    fi
}
fzf_change_directory() {
    local directory=$(
      fd --type d | \
      fzf --query="$1" --no-multi --select-1 --exit-0 \
          --preview 'tree -C {} | head -100'
      )
    if [[ -n $directory ]]; then
        cd "$directory"
    fi
}
fzf_grep_edit(){
    if [[ $# == 0 ]]; then
        echo 'Error: search term was not provided.'
        return
    fi
    local match=$(
      rg --color=never --line-number "$1" |
        fzf --no-multi --delimiter : \
            --preview "bat --color=always --line-range {2}: {1}"
      )
   local file=$(echo "$match" | cut -d':' -f1)
    if [[ -n $file ]]; then
        $EDITOR "$file" +$(echo "$match" | cut -d':' -f2)
    fi
}
fzf_kill() {
    local pid_col
    if [[ $(uname) = Linux ]]; then
        pid_col=2
    elif [[ $(uname) = Darwin ]]; then
        pid_col=3;
    else
        echo 'Error: unknown platform'
        return
    fi
    local pids=$(
      ps -f -u $USER | sed 1d | fzf --multi | tr -s [:blank:] | cut -d' ' -f"$pid_col"
      )
    if [[ -n $pids ]]; then
        echo "$pids" | xargs kill -9 "$@"
    fi
}

# find the given word and open with the default program : requires arguement
alias fif='fzf_find_in_file'
# find the given folder name and open with neovim : no arguement required
alias ffe='fzf_find_edit'
# change the folder with the word given later : no arguement required
alias fcd='fzf_change_directory'
# find the given word and open with neovim : requires arguement
alias fge='fzf_grep_edit'
# kill any selected process : no arguement required
alias fkill='fzf_kill'

#########
# Alias #
#########
alias sz="source ~/.zshrc"
alias nh="nvim ~/.zsh_history"
alias nt="nvim ~/.tmux.conf"
alias nz="nvim ~/.zshrc"
alias ls="ls --color=auto"
alias ll="ls --color=auto -al"
alias lll="ls --color=auto -alhTOe@"
# option -Y means trusted option for -X
######################
# TMUX Configuration #
######################
# Tmux configuration : now it is called from separate shell script(tmuxkillf.sh)
tmuxkillf () {
    local sessions
    sessions="$(tmux ls|fzf --exit-0 --multi)"  || return $?
    local i
    for i in "${(f@)sessions}"
    do
        [[ $i =~ '([^:]*):.*' ]] && {
            echo "Killing $match[1]"
            tmux kill-session -t "$match[1]"
        }
    done
}
# For adding new session without leaving Tmux session
_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

# LF tool for landing where you navigated to upon exit
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
# ensure_tmux_is_running

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/jaewlee/sw/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/jaewlee/sw/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/jaewlee/sw/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/jaewlee/sw/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# export PATH="/Users/jaewlee/sw/anaconda3/bin:$PATH"
# <<< conda initialize <<<
