FROM node:22.17.0-alpine3.21@sha256:e461a496f5ed8159268a6550adb8d3f182f009810a52b6a61701c3e90adba016
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
