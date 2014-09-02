
# If not running interactively, don't do anything
[ -z "${PS1}" ] && return

# set 256 color profile where possible
if [[ $COLORTERM == gnome-* && $TERM == xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
    export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
    export TERM=xterm-256color
fi

load_dotfiles() {
    declare -a files=(
        $HOME/.bash-lib/bash_options # Options
        $HOME/.bash-lib/bash_exports # Exports
        $HOME/.bash-lib/bash_aliases # Aliases
        $HOME/.bash-lib/functions/*  # Functions
        $HOME/.bash-lib/bash_prompt  # Custom bash prompt
        $HOME/.bash-lib/bash_paths   # Path modifications
        $(brew --prefix)/etc/bash_completion # Bash completion (installed via Homebrew)
        $HOME/.bash_profile.local # Local and private settings not under version control (e.g. git credentials)
    )

    # if these files are readable, source them
    for index in ${!files[*]}
    do
        if [[ -r ${files[$index]} ]]; then
            source ${files[$index]}
        fi
    done
}

load_dotfiles
unset load_dotfiles
