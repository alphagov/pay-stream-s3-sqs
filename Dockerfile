FROM node:18.20.7-alpine3.20@sha256:853c72c7052192499f17190db292afc2340e0a825c40061386525b107bb6a39b AS builder
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
