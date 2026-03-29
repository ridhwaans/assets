#!/bin/sh
# Sekiguchi - Shell color setup script

if [ "${TERM%%-*}" = 'linux' ]; then
    return 2>/dev/null || exit 0
fi

color00="0f/10/10"
color01="c0/4a/56"
color02="8b/bf/7a"
color03="d4/c0/8a"
color04="7a/a2/c9"
color05="a3/8a/d3"
color06="7b/d4/c7"
color07="e7/e5/de"
color08="23/25/25"
color09="d8/60/69"
color10="a5/d5/95"
color11="e6/d2/9f"
color12="95/b8/db"
color13="bc/a4/e5"
color14="97/e2/d6"
color15="fb/fa/f4"
color_foreground="e7/e5/de"
color_background="0f/10/10"
color_cursor="ff/6b/6b"

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
  printf $printf_template_custom Pg ecebe4
  printf $printf_template_custom Ph 101111
  printf $printf_template_custom Pi e7e5de
  printf $printf_template_custom Pj 2a2c2c
  printf $printf_template_custom Pk e7e5de
  printf $printf_template_custom Pl ff6b6b
  printf $printf_template_custom Pm 101111
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
