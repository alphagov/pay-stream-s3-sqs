FROM node:18.20.4-alpine3.20@sha256:a25c1e4ecc284985f4cbc449021e9259560c644dd9611e5a72d9c4750f24f6c7 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
