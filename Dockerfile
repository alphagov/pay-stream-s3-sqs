FROM node:18.20.6-alpine3.20@sha256:9b49071c2ecd7389a2aba1c67a35695cd48bd79100515c97392ba1c0591b61a9 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
