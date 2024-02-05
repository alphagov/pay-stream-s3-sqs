FROM node:18.19.0-alpine3.18@sha256:ae124a073f5655a04381a2d95b3c32da4adf5c279f912af432885e7249814156 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
