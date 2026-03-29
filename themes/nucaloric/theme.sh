#!/bin/sh
# NuCaloric - Shell color setup script

if [ "${TERM%%-*}" = 'linux' ]; then
    return 2>/dev/null || exit 0
fi

color00="12/15/0e"
color01="c9/6b/3b"
color02="88/b0/4b"
color03="d7/b7/5c"
color04="4f/6b/55"
color05="8a/6f/86"
color06="6d/a3/91"
color07="d9/dd/c7"
color08="2a/30/20"
color09="e0/84/52"
color10="a1/c4/61"
color11="ed/cc/73"
color12="68/87/70"
color13="a4/86/9f"
color14="88/b9/a9"
color15="f4/f6/e9"
color_foreground="d9/dd/c7"
color_background="12/15/0e"
color_cursor="e8/f2/a8"

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
  printf $printf_template_custom Pg e0e4cf
  printf $printf_template_custom Ph 171b10
  printf $printf_template_custom Pi d9ddc7
  printf $printf_template_custom Pj 343b29
  printf $printf_template_custom Pk d9ddc7
  printf $printf_template_custom Pl e8f2a8
  printf $printf_template_custom Pm 171b10
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
