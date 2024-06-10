FROM node:18.20.3-alpine3.19@sha256:e5df78451e4a2dc2e8605642b1d7691bf079d6fb66ae2d862714a88b4383ec61 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
