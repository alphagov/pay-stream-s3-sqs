FROM node:18.20.6-alpine3.20@sha256:12c7561101f6afced8d79febd44f2a135f1096c35e5e1b942bd8c8efa662ab48 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
