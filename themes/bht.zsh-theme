# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background and the font Inconsolata.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
# 
# http://ysmood.org/wp/2013/03/my-ys-terminal-theme/
# Mar 2013 ys
# modified Apr 2014 Brian Trammell

# Directory info
local current_dir='${PWD/#$HOME/~}'

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}on%{$reset_color%} git:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}o"

# Identity with different coloring for root
if [[ "$(whoami)" == "root" ]]; then
    local identity="%{$terminfo[bold]$bg[red]$fg[white]%}%n@%m%{$reset_color%}"
else
    local identity="%{$fg[cyan]%}%n%{$fg[white]%}@%{$fg[green]%}%m%{$reset_color%}"
fi

# Return status
local ret_status="%(?:%{$fg_bold[green]%}->:%{$fg_bold[red]%}->)"

# Prompt format: \n # -> (status) USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] \n $ 
PROMPT="
${ret_status} ${identity} \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info} \
%{$fg[white]%}[%*]
%{$terminfo[bold]%}%# %{$reset_color%}"