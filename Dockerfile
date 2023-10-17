FROM node:18.18.2-alpine3.18@sha256:0fe7402d11d8c85474c6ec6f9c9c8048cd0549c95535832b7f0735a4b47690a5 AS builder
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
