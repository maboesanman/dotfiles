local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

function git_prompt_info() {
 ref=$(git symbolic-ref HEAD 2> /dev/null) || return
 echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX$(parse_git_dirty)"
}

function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

PROMPT='$ret_status %{$fg[white]%}$(get_pwd) $(git_remote_status) $(git_prompt_info)%{$reset_color%}%{$reset_color%} '

# # set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✓%{$reset_color%}"

# ZSH_THEME_GIT_PROMPT_PREFIX=""
# ZSH_THEME_GIT_PROMPT_SUFFIX=""
# ZSH_THEME_GIT_PROMPT_DIRTY="*"
# ZSH_THEME_GIT_PROMPT_CLEAN=""

# ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%} ✱%{$reset_color%}"

# set the git_prompt_status text
ZSH_THEME_GIT_PROMPT_UNTRACKED="○"
ZSH_THEME_GIT_PROMPT_ADDED="•"
# ZSH_THEME_GIT_PROMPT_MODIFIED
# ZSH_THEME_GIT_PROMPT_RENAMED
# ZSH_THEME_GIT_PROMPT_DELETED
# ZSH_THEME_GIT_PROMPT_STASHED
# ZSH_THEME_GIT_PROMPT_UNMERGED
# ZSH_THEME_GIT_PROMPT_AHEAD
# ZSH_THEME_GIT_PROMPT_BEHIND
# ZSH_THEME_GIT_PROMPT_DIVERGED

ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE=""
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg[green]%}↑%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg[yellow]%}↓%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg[yellow]%}⇅%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR

# ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_PREFIX
# ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_SUFFIX