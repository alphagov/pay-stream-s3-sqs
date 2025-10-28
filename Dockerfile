FROM node:22.21.0-alpine3.21@sha256:03a43779873834861f97dc1d2cc7be8aeb7f910a6fc60bd1c42d69d4dfd008fb
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
