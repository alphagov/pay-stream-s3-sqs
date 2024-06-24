FROM node:18.20.3-alpine3.19@sha256:7b107ff15badea2943b278013055f0af97fa2e73ee2631fcb9a78c5b7d1fa99e AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
