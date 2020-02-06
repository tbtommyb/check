#!/usr/bin/env bash

set -e

DATE=$(date "+%Y-%m-%d")
TIME=$(date "+%H:%M")
LOG_FILE=$( printf "$HOME/hours/%s.log" $(date "+%Y-%m"))

if [ ! -f $LOG_FILE ]; then
  touch $LOG_FILE
fi

if [ "$#" -ne 1 ]; then
  echo "Usage: check in|out"
  exit 1
fi

if [[ ! "$1" =~ ^(in|out)$ ]]; then
  echo "Usage: check in|out"
  exit 1
fi

if [[ "$1" == "in" ]]; then
  if grep -Fq $DATE $LOG_FILE
  then
    echo "Error: already checked in today"
  else
    printf "%s: %s\n" $DATE $TIME >> $LOG_FILE
  fi
fi

if [[ "$1" == "out" ]]; then
  if grep -Fq $DATE $LOG_FILE
  then
    if grep -qe "$DATE: [0-9][0-9]:[0-9][0-9]$" $LOG_FILE
    then
      sed -i '.bak' "/^$DATE:/ s/$/ - $TIME/" $LOG_FILE
    else
      echo "Error: already checked out today"
      exit 1
    fi
  else
    echo "Error: not yet checked in today"
    exit 1
  fi
fi
