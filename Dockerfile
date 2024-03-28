FROM node:18.20.0-alpine3.18@sha256:63008551461d4550a3567af2d56ebb624e56db93f7ef951bf2ea5f41ef63d2e4 AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
