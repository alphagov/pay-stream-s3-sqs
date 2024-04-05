FROM node:18.20.1-alpine3.19@sha256:fdaafba89e47a9716571df803d7759392b51ba7fbaddbeefdb433abbaedc25f6 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
