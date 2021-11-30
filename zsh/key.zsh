# <https://wiki.archlinux.org/title/Zsh#Command_completion>
# <https://zshwiki.org/home/keybindings/>
# <https://jdhao.github.io/2019/06/13/zsh_bind_keys/>

bindkey -e # emacs keymap

source ~/zsh/linux-keyboard.sh

[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
[[ -n "${key[C-Left]}"    ]] && bindkey -- "${key[C-Left]}"     backward-word
[[ -n "${key[C-Right]}"   ]] && bindkey -- "${key[C-Right]}"    forward-word

# History search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "\ep" up-line-or-beginning-search
bindkey "\en" down-line-or-beginning-search

# [[ -n "${key[A-Left]}"  ]] && bindkey -- "${key[A-Left]}"  emacs-backward-word
# [[ -n "${key[A-Right]}" ]] && bindkey -- "${key[A-Right]}" emacs-forward-word

# My customs
bindkey -s '^o' "ra\n"
bindkey "^[ " magic-space
bindkey "^[!" expand-history
