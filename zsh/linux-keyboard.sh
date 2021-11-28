# Warning: Delete key sends ^[[3~ (not ^?)
# Warning: Backspace sends ^?
# source ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}
# ~/.zkbd/xterm-256color-pc-linux-gnu

typeset -g -A key

key[F1]='^[OP'
key[F2]='^[OQ'
key[F3]='^[OR'
key[F4]='^[OS'
key[F5]='^[[15~'
key[F6]='^[[17~'
key[F7]='^[[18~'
key[F8]='^[[19~'
key[F9]='^[[20~'
key[F10]='^[[21~'
key[F11]='^[[23~'
key[F12]='^[[24~'
key[Backspace]='^?'
key[Insert]='^[[2~'
key[Home]='^[[H'
key[PageUp]='^[[5~'
key[Delete]='^[[3~'
key[End]='^[[F'
key[PageDown]='^[[6~'
key[Up]='^[[A'
key[Down]='^[[B'
key[Right]='^[[C'
key[Left]='^[[D'

key[C-Up]=';5A'
key[C-Down]=';5B'
key[C-Right]=';5C'
key[C-Left]=';5D'

key[A-Up]=';3A'
key[A-Down]=';3B'
key[A-Right]=';3C'
key[A-Left]=';3D'
