FROM node:22.17.0-alpine3.21@sha256:6efabc870564b9c026355f314c4398c3899e1a34ac57f910b4d5f99fd2fb39c0
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
