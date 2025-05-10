Fmie--primary
A lightweight server management toolkit for deploying and maintaining web applications, SSL certificates, and keepalive functionality.
Current Version: v1.0.0Latest Version: v1.2.2Author: Fmie
Features

KeepAlive: Ensures server processes remain active with configurable intervals and notifications.
SSL Management: Automates SSL certificate issuance and renewal using Let's Encrypt.
Domain Support: Hosts static websites for various applications (e.g., education, HR, blogs).
Notifications: Supports Telegram and WeChat notifications for server events.
Web Management: Includes a Node.js-based web interface for managing keepalive tasks.

Installation

Clone the repository:git clone https://github.com/Fmie/Fmie--primary.git
cd Fmie--primary


Install dependencies for the keepalive web server:cd keepalive
npm install


Configure environment variables in keepalive/config.json (see Configuration).
Run the keepalive web server:node keepalive/app.js


Set up cron jobs for SSL renewal:crontab -e
# Add: 0 0 * * * /path/to/Fmie--primary/ssl/cronSSL.sh yourdomain.com



Configuration
Create a keepalive/config.json file with the following structure:
{
  "token": "your-secret-token",
  "interval": 5,
  "showlog": "Y",
  "img": "nezha.jpg"
}

Directory Structure

.github/workflows/: GitHub Actions for deployment and synchronization.
domains-support/websites/: Static HTML files for hosted websites.
keepalive/: Node.js web server for keepalive functionality.
ssl/: Scripts for SSL certificate management.
*.sh: Utility scripts for notifications and server tasks.

Contributing
Contributions are welcome! Please submit a pull request or open an issue on GitHub.
License
This project is licensed under the MIT License. See the LICENSE file for details.
