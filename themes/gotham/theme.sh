#!/bin/sh
# Gotham - Shell color setup script

if [ "${TERM%%-*}" = 'linux' ]; then
    return 2>/dev/null || exit 0
fi

color00="0a/0f/14"
color01="c3/30/27"
color02="26/a9/8b"
color03="ed/b5/4b"
color04="19/54/65"
color05="4e/51/65"
color06="33/85/9d"
color07="98/d1/ce"
color08="10/15/1b"
color09="d2/69/39"
color10="08/1f/2d"
color11="24/53/61"
color12="09/37/48"
color13="88/8b/a5"
color14="59/9c/aa"
color15="d3/eb/e9"
color_foreground="98/d1/ce"
color_background="0a/0f/14"
color_cursor="98/d1/ce"

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
  printf $printf_template_custom Pg d8d8d8
  printf $printf_template_custom Ph 181818
  printf $printf_template_custom Pi d8d8d8
  printf $printf_template_custom Pj 383838
  printf $printf_template_custom Pk d8d8d8
  printf $printf_template_custom Pl d8d8d8
  printf $printf_template_custom Pm 181818
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
