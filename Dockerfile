FROM node:18.19.1-alpine3.18@sha256:bacc59da35fc5ddf4b93846733e0d5b9bfe49a118a0240e9d31578dd6a7417c0 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
