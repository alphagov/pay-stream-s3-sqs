FROM node:16.20.0-alpine3.17@sha256:1cd89de178c5f0d886e56e7505420d5e6e53d353da302d6b3b61b22221bfde29
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
