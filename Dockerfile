FROM node:21.1.0-alpine3.18@sha256:df76a9449df49785f89d517764012e3396b063ba3e746e8d88f36e9f332b1864 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
