#!/bin/bash

# Keepalive script for Fmie--primary

installpath="$HOME"
user=$(whoami)
projectDir="${installpath}/Fmie--primary"

# Load utility functions
if [[ -e "${projectDir}/utils.sh" ]]; then
  source "${projectDir}/utils.sh"
fi

# Parameters
autoupdate=${1:-noupdate}
sendtype=${2:-null}
telegramtoken=${3:-null}
telegramuserid=${4:-null}
wxsendkey=${5:-null}
buttonurl=${6:-null}
pass=${7:-null}

# Log function
log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# Check if keepalive is needed
log "Running keepalive for user: $user"
log "Parameters: autoupdate=$autoupdate, sendtype=$sendtype"

# Send notification if configured
if [[ "$sendtype" == "telegram" && "$telegramtoken" != "null" && "$telegramuserid" != "null" ]]; then
  export TELEGRAM_TOKEN="$telegramtoken" TELEGRAM_USERID="$telegramuserid"
  msg="Keepalive triggered for $user on $(hostname)"
  "${projectDir}/tgsend.sh" "$msg"
elif [[ "$sendtype" == "wechat" && "$wxsendkey" != "null" ]]; then
  export WXSEND_KEY="$wxsendkey"
  msg="Keepalive triggered for $user on $(hostname)"
  "${projectDir}/wxsend.sh" "$msg"
fi

log "Keepalive completed"