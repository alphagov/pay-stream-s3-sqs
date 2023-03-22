FROM node:16.19.1-alpine3.17@sha256:fcb03294d3c0695cf9762dec94c0366f08e7a8c6a3c1e062d38c80ac30684d8a
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
