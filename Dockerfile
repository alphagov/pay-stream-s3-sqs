FROM node:18.20.1-alpine3.19@sha256:6d9d5269cbe4088803e9ef81da62ac481c063b60cadbe8e628bfcbb12296d901 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
