FROM node:18.20.6-alpine3.20@sha256:cee65f51bda64bcb9ba38a7cc35b4d8bfef8ada2d3a97653064906ee400465e6 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
