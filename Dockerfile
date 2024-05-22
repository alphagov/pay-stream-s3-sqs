FROM node:18.20.3-alpine3.19@sha256:3120b21ed49333280d78dfe44b6eabc25c3309c3366bbcfa409b804334fd16ab AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
