FROM node:18.18.1-alpine3.18@sha256:617b85a014faf7aabe0661885a245cf3022e39675661d5795ab6748bb2f20f0f AS builder
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
