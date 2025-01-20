FROM node:18.20.5-alpine3.20@sha256:2827b0ceb8d855cf7d2cdf2b0a8e9f5c3c91362b49f9c8d35f7db0d34167fd89 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
