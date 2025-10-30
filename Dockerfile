FROM node:22.21.1-alpine3.21@sha256:5f2b71c056f3bfb48462f67d1d99fc59e580460e87f88a5fb6f203819c3e74bf
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
