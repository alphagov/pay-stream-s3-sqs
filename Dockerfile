FROM node:18.20.4-alpine3.19@sha256:a7e7de2a0211ef55482fc13fd25021a9f1b2cc8fd0df2e6c34b60abddf603a54 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
