FROM node:22.22.3-alpine@sha256:968df39aedcea65eeb078fb336ed7191baf48f972b4479711397108be0966920
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
