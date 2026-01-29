FROM node:22.22.0-alpine3.22@sha256:7aa86fa052f6e4b101557ccb56717cb4311be1334381f526fe013418fe157384
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
