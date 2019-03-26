#!/bin/sh

awk '
BEGIN {
  IGNORECASE=1
}
  /cocaine/ {
    printf("cocaine;drugs\n")
  }
  /bash[;:] pip[;:] command not found/ {
    printf("pip_not_found;stackoverflow\n")
  }
  /ImportError: No module named yaml/ {
    printf("python_yaml;stackoverflow\n")
  }
'

