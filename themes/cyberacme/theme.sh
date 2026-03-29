#!/bin/sh
# CyberAcme - Shell color setup script

if [ "${TERM%%-*}" = 'linux' ]; then
    return 2>/dev/null || exit 0
fi

color00="07/14/1c"
color01="ff/5f/87"
color02="3b/e8/b0"
color03="f5/d7/6e"
color04="33/bb/ff"
color05="6d/7c/ff"
color06="19/e3/ff"
color07="b7/f0/ff"
color08="0f/25/30"
color09="ff/7a/9c"
color10="5d/f3/c2"
color11="ff/e5/8f"
color12="5d/cd/ff"
color13="93/9d/ff"
color14="64/ee/ff"
color15="ea/fc/ff"
color_foreground="b7/f0/ff"
color_background="07/14/1c"
color_cursor="7d/f9/ff"

if [ -n "$TMUX" ]; then
  printf_template="\033Ptmux;\033\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033Ptmux;\033\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033Ptmux;\033\033]%s%s\007\033\\"
elif [ "${TERM%%-*}" = "screen" ]; then
  printf_template="\033P\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033P\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033P\033]%s%s\007\033\\"
else
  printf_template="\033]4;%d;rgb:%s\033\\"
  printf_template_var="\033]%d;rgb:%s\033\\"
  printf_template_custom="\033]%s%s\033\\"
fi

printf $printf_template 0  $color00
printf $printf_template 1  $color01
printf $printf_template 2  $color02
printf $printf_template 3  $color03
printf $printf_template 4  $color04
printf $printf_template 5  $color05
printf $printf_template 6  $color06
printf $printf_template 7  $color07
printf $printf_template 8  $color08
printf $printf_template 9  $color09
printf $printf_template 10 $color10
printf $printf_template 11 $color11
printf $printf_template 12 $color12
printf $printf_template 13 $color13
printf $printf_template 14 $color14
printf $printf_template 15 $color15

if [ -n "$ITERM_SESSION_ID" ]; then
  printf $printf_template_custom Pg c8f6ff
  printf $printf_template_custom Ph 08161f
  printf $printf_template_custom Pi b7f0ff
  printf $printf_template_custom Pj 102a36
  printf $printf_template_custom Pk b7f0ff
  printf $printf_template_custom Pl 7df9ff
  printf $printf_template_custom Pm 08161f
else
  printf $printf_template_var 10 $color_foreground
  printf $printf_template_var 11 $color_background
  printf $printf_template_var 12 $color_cursor
fi

unset printf_template
unset printf_template_var
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color_foreground
unset color_background
unset color_cursor
