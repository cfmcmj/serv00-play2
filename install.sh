echo '#!/bin/bash

# Fmie--primary Installation Script
# Author: Fmie

if [[ "$1" == "--install" ]]; then
  echo "Installing Fmie--primary..."
  git clone https://github.com/cfmcmj/Fmie--primary.git
  cd Fmie--primary
  cd keepalive
  npm install express body-parser
  cd ..
  echo "Installation complete. Please configure keepalive/config.json and run: node keepalive/app.js"
else
  echo "Usage: bash install.sh --install"
fi' > install.sh