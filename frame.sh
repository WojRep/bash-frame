#!/bin/bash


show_frame_section () {
  text=$1
  ramka_len=$2
  ramka_char="#"
  text_len=${#text}

  if [ "$((ramka_len-4))" -le "$text_len" ] ; then
    ramka_len=$((text_len+4))
  fi

  text_srodek=$(echo "scale=0; $text_len/2" | bc)
  ramka_srodek=$(echo "scale=0; $ramka_len/2" | bc)

  space=`printf "%*s" "$((ramka_srodek-text_srodek-1))" ""`
  ramka_text=`printf '%s%s%s' "$space" "$text" "$space"| cut -c 1-$((ramka_len-2))`

  printf '%s\n' $(printf $ramka_char'%.0s' $(seq 1 $ramka_len))
  printf '%s%*s%s\n' "$ramka_char" "$((ramka_len-2))" "" "$ramka_char"
  printf '%s%s%s\n' "$ramka_char" "$ramka_text" "$ramka_char"
  printf '%s%*s%s\n' "$ramka_char" "$((ramka_len-2))" "" "$ramka_char"
  printf '%s\n' $(printf $ramka_char'%.0s' $(seq 1 $ramka_len))
}

