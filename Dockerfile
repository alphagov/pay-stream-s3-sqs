FROM node:18.20.2-alpine3.19@sha256:80338ff3fc4e989c1d5264a23223cec1c6014e812e584e825e78d1a98d893381 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
