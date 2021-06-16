#!/bin/bash -e
#   Simple way how to rotate logs without logrotate
#   but with truncating source file (nice for docker containers)
#
# ---
# msirovy (at) gmail.com


# INPUT:
#  - For example: logs/*.log
LOG_FILES=$@


echo ${LOG_FILES}

for lf in ${LOG_FILES}; do
  echo -n "Rotate log $lf";
  gzip -fk $lf && {
    truncate -s 0 $lf
    echo "... Done"
  } || {
    echo "... Failed!"
  }
done
