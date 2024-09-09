FROM node:18.20.4-alpine3.20@sha256:02376a266c84acbf45bd19440e08e48b1c8b98037417334046029ab585de03e2 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
