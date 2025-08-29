FROM node:22.19.0-alpine3.21@sha256:7f48a7dfe3e895f5fabff082463e316d56f35f07005ca0d9ebacdc92ddf2b883
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
