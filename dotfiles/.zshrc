# Luke's config for the Zoomer Shell

# Enable colors and change prompt:
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%b)'
setopt PROMPT_SUBST
PROMPT='%F{10}${PWD/#$HOME/~} %F{12}${vcs_info_msg_0_}%{$reset_color%} > '
# PS1="%B%F{12}[%F{10}%n%F{12}@%M %F{13}%~%F{12}]%{$reset_color%}$ "
# PS1='%F{10}%${PWD/#$HOME/~}%F{12}$(vcs_info_msg_0_)$%{$reset_color%} '

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt hist_ignore_all_dups #dont save doplucate commands
setopt hist_ignore_space #dont save spaces in history file
# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
export HISTFILE=~/.zsh_history

# vi mode
bindkey -v
export KEYTIMEOUT=1
setopt HIST_IGNORE_SPACE

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
#lfcd () {
#    tmp="$(mktemp)"
#    lf -last-dir-path="$tmp" "$@"
#    if [ -f "$tmp" ]; then
#        dir="$(cat "$tmp")"
#        rm -f "$tmp"
#        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
#    fi
#}
#bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
#[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
#[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Load zsh-syntax-highlighting; should be last.
progl() {
 export LD_LIBRARY_PATH="${HOME}/pro/drivers:${LD_LIBRARY_PATH}"
  export LIBGL_DRIVERS_PATH="${HOME}/pro/drivers/dri"
  export dri_driver="amdgpu"
}

export PATH="$PATH:/opt/android-ndk"
export ANDROID_NDK=/opt/android-ndk
# Some programs such as gradle ask this as well:
export ANDROID_NDK_HOME=/opt/android-ndk
export LLVM_DIR=/usr

alias ls='ls --color=auto'
alias runback="swag init -p pascalcase --generatedTime && go run main.go"
alias conectdb="psql -h 172.21.9.49 -p 5432 -U meallabs meal_labs -W"
alias enterdb="docker exec -it postgres psql -U meal_labs meal_labs_db"
alias enterapp="docker exec -it meal_labs-back bash"
alias lasttag="git tag --sort=committerdate | tail -1"
alias arduinoupload="arduino-cli compile --fqbn arduino:avr:uno && sudo arduino-cli upload -b arduino:avr:uno -p /dev/ttyACM0"
alias timeit='/usr/bin/time -f "total time: %e"'
alias cleanimg='detox . && for file in *; do convert $file "$(uuidgen).png"; done'
alias localsend="oneshot send --qr-code"

alias deploytofix="./devscripts/deploytofix"
alias start="docker-compose up"

export XDG_SESSION_TYPE="wayland dbus-run-session gnome-session"
export PATH="$HOME/scripts:$PATH"
alias npm="source /usr/share/nvm/init-nvm.sh; npm"

# create config variables
source $HOME/.config/vars
if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi
# neofetch

eval "$(direnv hook zsh)"

export CHROME_EXECUTABLE=/usr/bin/brave
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# source /usr/share/nvm/init-nvm.sh

# pnpm
export PNPM_HOME="/home/david/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
