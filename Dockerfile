FROM node:22-slim
RUN apt update && apt -y install --no-install-recommends --no-install-suggests curl dumb-init && apt clean && apt -y autoremove && rm -rf /var/lib/{apt,dpkg,cache,log} && rm -rf /var/cache/* && rm -rf /var/log/apt/* && rm -rf /tmp/*
WORKDIR /app

RUN groupadd -g 1001 nodejs && useradd -u 1001 -g nodejs -m -s /bin/bash nextjs

COPY package.json ./
RUN npm i --legacy-peer-deps

EXPOSE 8000
