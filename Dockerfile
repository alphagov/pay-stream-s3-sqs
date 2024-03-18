FROM node:18.19.1-alpine3.18@sha256:1163db1dad710d579fc19831492f50c8b04ce6221d4fa86f9c2f5d564d35daa1 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
