FROM node:18.20.1-alpine3.19@sha256:cbd31807a8b4621a9dea342a03f14e8c53f5ca78a395f426bb5bd0e7f071c47c AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
