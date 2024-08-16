FROM node:18.20.4-alpine3.20@sha256:17514b20acef0e79691285e7a59f3ae561f7a1702a9adc72a515aef23f326729 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
