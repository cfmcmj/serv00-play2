#!/bin/bash

# Utility functions for Fmie--primary

# Print colored text
red() {
  echo -e "\033[31m$1\033[0m"
}

green() {
  echo -e "\033[32m$1\033[0m"
}

yellow() {
  echo -e "\033[33m$1\033[0m"
}

# Get domain for the current user
getDoMain() {
  local user=$(whoami)
  local domain=$(devil domain list | grep "$user" | awk '{print $1}')
  echo "$domain"
}