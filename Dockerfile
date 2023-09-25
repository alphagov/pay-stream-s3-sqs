FROM node:18.18.0-alpine3.18@sha256:619ce27eb37c7c0476bd518085bf1ba892e2148fc1ab5dbaff2f20c56e50444d AS builder
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
