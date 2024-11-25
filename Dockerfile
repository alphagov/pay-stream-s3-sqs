FROM node:18.20.5-alpine3.20@sha256:7e43a2d633d91e8655a6c0f45d2ed987aa4930f0792f6d9dd3bffc7496e44882 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
