# Mark the name as a function
# some other useful info: http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
# https://unix.stackexchange.com/questions/33255/how-to-define-and-load-your-own-shell-function-in-zsh
autoload edit-command-line; zle -N edit-command-line
bindkey -v

bindkey '^e' edit-command-line
# bindkey -M vicmd "h" vi-insert
# bindkey -M vicmd "H" vi-insert-bol
# bindkey -M vicmd "j" vi-backward-char
# bindkey -M vicmd "l" vi-forward-char
# bindkey -M vicmd "J" vi-beginning-of-line
# bindkey -M vicmd "L" vi-end-of-line
# bindkey -M vicmd "i" up-line-or-history
# bindkey -M vicmd "k" down-line-or-history

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ $KEYMAP == main ]] ||
       [[ $KEYMAP == viins ]] ||
       [[ $KEYMAP = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
  zle reset-prompt
}
zle -N zle-keymap-select

# Use beam shape cursor for each new prompt
_fix_cursor() {
  echo -ne '\e[6 q'
}
precmd_functions+=(_fix_cursor)

KEYTIMEOUT=1
