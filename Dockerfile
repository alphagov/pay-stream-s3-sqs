FROM node:18.6.0-alpine3.15@sha256:4203fefa49002c75075c1fc389a0655cc7cad21ad4e9d746f3f6f30deb2c950d
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
