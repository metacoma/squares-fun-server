#!/bin/sh

awk '
BEGIN {
  IGNORECASE=1
}
  /shop([0-9]+)/ {
    shop_n=gensub(".*shop([0-9]+).*", "\\1", "g")
    printf("shop%d;shop\n", shop_n)
  }
'

