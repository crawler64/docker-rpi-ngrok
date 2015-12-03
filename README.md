NGROK for Raspberry PI
=======================

# Quickstart
1. clone this repo
1. `docker build -t local/ngrok .`
1. `docker run -d -e AUTHTOKEN=<your_auth_token> -e HTTP_PORT=80 local/ngrok`

# Status
proof of concept
