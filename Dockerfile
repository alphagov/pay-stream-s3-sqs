FROM node:18.20.8-alpine3.20@sha256:a25c800a782c8fd378561a294d877a72ea289bb0676fbbe619c10a1efc8373c2 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
