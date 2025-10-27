FROM node:22.21.0-alpine3.21@sha256:33daae47717b9b6107fd271e6608efe7c1bd1c9b448b3f30ce2f7027f5d96ffa
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
