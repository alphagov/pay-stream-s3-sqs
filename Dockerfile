FROM node:17.7.2-alpine3.15@sha256:1ef397a038d809785a1f787de87fbb496d10ee1b0565068289da1c5cac0d1fe4
COPY package.json package-lock.json ./
RUN npm ci --no-progress
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
