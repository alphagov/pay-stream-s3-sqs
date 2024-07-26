FROM node:18.20.4-alpine3.19@sha256:dfc737c864950bb3a56546b99ba2d2479d693d6563460a379fb56fe7ccfe6967 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
