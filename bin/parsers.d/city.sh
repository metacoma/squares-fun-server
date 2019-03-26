#!/bin/sh

awk '
BEGIN {
  IGNORECASE=1
}
  /San Francisco/ {
    printf("San Francisco;city\n")
  }
  /Barstow/ {
    printf("Barstow;city\n")
  }
  /Los Angeles/ {
    printf("Los Angeles;city\n")
  }
'

