FROM node:18.20.5-alpine3.20@sha256:162b79fedde05ef5d1dc1509561fcc9a21afb88585b9fed85b28d899b3f87637 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
