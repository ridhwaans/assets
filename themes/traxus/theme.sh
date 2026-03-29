#!/bin/sh
# Traxus - Shell color setup script

if [ "${TERM%%-*}" = 'linux' ]; then
    return 2>/dev/null || exit 0
fi

color00="11/12/14"
color01="c2/5b/47"
color02="7d/9b/65"
color03="d4/a2/4c"
color04="58/70/8d"
color05="85/73/9c"
color06="6f/9f/9c"
color07="e3/d7/bd"
color08="25/28/2d"
color09="db/74/5e"
color10="97/b5/7c"
color11="ec/be/67"
color12="73/89/a6"
color13="9f/8b/b6"
color14="8a/b9/b5"
color15="f7/f0/e2"
color_foreground="e3/d7/bd"
color_background="11/12/14"
color_cursor="f4/c8/6a"

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
  printf $printf_template_custom Pg e9deca
  printf $printf_template_custom Ph 131417
  printf $printf_template_custom Pi e3d7bd
  printf $printf_template_custom Pj 2f3338
  printf $printf_template_custom Pk e3d7bd
  printf $printf_template_custom Pl f4c86a
  printf $printf_template_custom Pm 131417
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
