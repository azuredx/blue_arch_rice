# meh. Dark Blood Rewind, a new beginning.
# azure custom theme (just changed all red to blue xd)
PROMPT=$'%{$fg[blue]%}┌[%{$fg_bold[white]%}%n%{$reset_color%}%{$fg[blue]%}@%{$fg_bold[white]%}%m%{$reset_color%}%{$fg[blue]%}] [%{$fg_bold[white]%}/dev/%y%{$reset_color%}%{$fg[blue]%}] %{$(git_prompt_info)%}%(?,,%{$fg[blue]%}[%{$fg_bold[white]%}%?%{$reset_color%}%{$fg[blue]%}])
%{$fg[blue]%}└[%{$fg_bold[white]%}%~%{$reset_color%}%{$fg[blue]%}]>%{$reset_color%} '
PS2=$' %{$fg[blue]%}|>%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}[%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[blue]%}] "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[blue]%}⚡%{$reset_color%}"
