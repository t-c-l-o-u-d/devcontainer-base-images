#!/usr/bin/bash
# GNU Affero General Public License v3.0 or later (see COPYING or https://www.gnu.org/licenses/agpl.txt)

# ===============================================================
# only evaluate remainder of file if running an interactive shell
# ===============================================================
# see bash(1) for more details
case $- in
*i*) ;;      # interactive shell; evaluate file
*) return ;; # non-interactive shell; do not evaluate file
esac

# ==============
# general config
# ==============
# check for bash completion
if [[ -s /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi

# waiting for bash to support this fully
# https://savannah.gnu.org/support/?108134
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"

# ${HOME}/.local/bin: ensure there is a place to store binaries
# ${XDG_CONFIG_HOME}/bash: ensure bash has a directory in XDG_CONFIG_HOME
# ${XDG_STATE_HOME}/bash: ensure bash has a directory in XDG_STATE_HOME
mkdir --parents "${HOME}/.local/bin" \
    "${XDG_CONFIG_HOME}/bash" \
    "${XDG_STATE_HOME}/bash"

# ensure the PATH sources binaries
if [[ ! "${PATH}" =~ ${HOME}/.local/bin ]]; then
    export PATH="${PATH}:${HOME}/.local/bin"
fi

# ensure vim is the default editor
if command -v vim &>/dev/null; then
    export EDITOR=vim
    export VISUAL="${EDITOR}"
fi

# ====================
# history file changes
# ====================
# see bash(1) for more details

# set default location for the history file
export HISTFILE="${XDG_STATE_HOME}/bash/history"

# append to the history file, don't overwrite it
shopt -s histappend

# set the format for viewing date/time stamps in history file
export HISTTIMEFORMAT="%Y-%m-%d %T %Z "

# ignore repeat commands
export HISTCONTROL="ignoredups"

# set number of commands to retain
export HISTSIZE=100000

# set number of lines to retain
export HISTFILESIZE=100000

# ================
# PS1 modification
# ================
# Color Listing:
# for c in {0..255}; do tput setaf $c; tput setaf $c ; echo "tput setaf $c"; done
_RED=$(tput setaf 1)
_GREEN=$(tput setaf 2)
_YELLOW=$(tput setaf 3)
_BLUE=$(tput setaf 4)
_PURPLE=$(tput setaf 5)
_CYAN=$(tput setaf 6)
_LIGHT_GRAY=$(tput setaf 7)
_DARK_GRAY=$(tput setaf 8)
_WHITE=$(tput setaf 15)
_BRIGHT=$(tput bold)
_NORMAL=$(tput sgr0)

#PS1_DATE="\[${_DARK_GRAY}\]\D{%Y-%m-%d %T %Z}\[${_NORMAL}\]"
PS1_HOST="\[${_GREEN}\]\H\[${_NORMAL}\]"
PS1_USER="\[${_CYAN}\]\u\[${_NORMAL}\]"


# container detection - podman
if [[ -s /run/.containerenv ]]; then
    _CNT_HOSTNAME="$(awk -F '[="]' '/name/{ print $3 }' /run/.containerenv) $(echo -e '\U0001F4E6')"
    PS1_HOST="\[${_YELLOW}\]\[${_CNT_HOSTNAME}\]\[${_NORMAL}\]"
fi

# sets the max path length
export PROMPT_DIRTRIM=3

PS1="\n${PS1_USER}@${PS1_HOST}: \w \n\$ "

# =========
# ssh agent
# =========
# ensure ssh-agent is running
if [ -z "${SSH_AUTH_SOCK}" ]; then
    # check for a currently running instance of the agent
    RUNNING_AGENT="$(pgrep -c 'ssh-agent -s')"
    if [ "${RUNNING_AGENT}" = "0" ]; then
        # launch a new instance of the agent
        ssh-agent -s &>"${HOME}/.ssh/ssh-agent"
    fi
    eval "$(cat "${HOME}"/.ssh/ssh-agent)" >/dev/null
fi

# =======
# aliases
# =======
if [[ -s "${XDG_CONFIG_HOME}/bash/aliases" ]]; then
    # shellcheck source=/dev/null
    source "${XDG_CONFIG_HOME}/bash/aliases"
fi

# =========
# functions
# =========
if [[ -s "${XDG_CONFIG_HOME}/bash/functions" ]]; then
    # shellcheck source=/dev/null
    source "${XDG_CONFIG_HOME}/bash/functions"
fi

# =============
# host specific
# =============
if [[ -s "${XDG_CONFIG_HOME}/bash/$(read -r KERNEL_HOSTNAME </proc/sys/kernel/hostname && echo "$KERNEL_HOSTNAME")" ]]; then
    # shellcheck source=/dev/null
    source "${XDG_CONFIG_HOME}/bash/$(read -r KERNEL_HOSTNAME </proc/sys/kernel/hostname && echo "$KERNEL_HOSTNAME")"
fi

# ===========
# root config
# ===========
if [[ "${EUID}" = 0 ]]; then
    PS1_ROOT_USER="\[${_RED}\]\u\[${_NORMAL}\]"
    PS1_ROOT_HOST="\[${_YELLOW}\]\H\[${_NORMAL}\]"

    PS1="\n$PS1_DATE\n$PS1_ROOT_USER@$PS1_ROOT_HOST: \w \n\\$ "
fi
