#!/bin/sh
# MIDA - Shell color setup script

if [ "${TERM%%-*}" = 'linux' ]; then
    return 2>/dev/null || exit 0
fi

color00="12/11/0f"
color01="dd/5d/3a"
color02="a1/c1/81"
color03="f5/b8/52"
color04="5c/7e/a6"
color05="9b/6d/9e"
color06="6e/b5/b0"
color07="e7/d8/c3"
color08="2a/25/20"
color09="f3/79/46"
color10="bb/d7/96"
color11="ff/cd/6a"
color12="76/98/c0"
color13="b4/84/b8"
color14="87/cc/c6"
color15="fb/f1/e7"
color_foreground="e7/d8/c3"
color_background="12/11/0f"
color_cursor="ff/9a/3c"

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
  printf $printf_template_custom Pg ebdfcf
  printf $printf_template_custom Ph 151310
  printf $printf_template_custom Pi e7d8c3
  printf $printf_template_custom Pj 332d26
  printf $printf_template_custom Pk e7d8c3
  printf $printf_template_custom Pl ff9a3c
  printf $printf_template_custom Pm 151310
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
