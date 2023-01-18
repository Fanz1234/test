FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install && npm i -g pm2 && pm2 save && pm2 logs && npm install qrcode-terminal

COPY . .

EXPOSE 5000

CMD ["node", "index.js"]
