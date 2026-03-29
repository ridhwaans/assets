#!/bin/sh
# Arachne - Shell color setup script

if [ "${TERM%%-*}" = 'linux' ]; then
    return 2>/dev/null || exit 0
fi

color00="0b/05/07"
color01="c8/4b/5a"
color02="7a/8c/54"
color03="c8/9a/4b"
color04="5c/4b/8a"
color05="8c/43/68"
color06="6f/8f/8b"
color07="e8/c4/c9"
color08="26/13/17"
color09="ff/6b/7a"
color10="91/a6/63"
color11="e0/b8/68"
color12="7c/67/b8"
color13="b0/61/89"
color14="93/b9/b4"
color15="f6/e6/e8"
color_foreground="e8/c4/c9"
color_background="0b/05/07"
color_cursor="f3/d5/da"

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
  printf $printf_template_custom Pg d9c2c8
  printf $printf_template_custom Ph 12090d
  printf $printf_template_custom Pi e8c4c9
  printf $printf_template_custom Pj 2a161b
  printf $printf_template_custom Pk e8c4c9
  printf $printf_template_custom Pl f3d5da
  printf $printf_template_custom Pm 12090d
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
