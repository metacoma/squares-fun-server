#!/bin/sh

awk '
BEGIN {
  IGNORECASE=1
}
  /cash/ {
    printf("300;cash\n")
  }
'

