#!/bin/ash

curl -o /app/xo-web/assets/main.css https://raw.githubusercontent.com/oberthur/docker-xo/master/main.css

curl -o /app/xo-web/assets/logo.png https://pbs.twimg.com/profile_images/623081042656669696/wJARcJef_400x400.png

sed -i 's/images\/logo_small.png/assets\/logo.png/' /app/xo-server/signin.pug

sed -i 's/styles\/main.css/assets\/main.css/' /app/xo-server/signin.pug

sed -i 's/favicon|fontawesome/favicon|fontawesome|assets/' /app/xo-server/dist/index.js
