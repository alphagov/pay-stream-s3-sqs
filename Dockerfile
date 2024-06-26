FROM node:18.20.3-alpine3.19@sha256:acb08e6aa07aa2c24bd4b8bb8031b9032dfa7b4aefadf111b634d3e0b7b18f39 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
