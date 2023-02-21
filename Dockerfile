FROM node:16.19.1-alpine3.17@sha256:0fcf4fb718a763fa53ac8d60073a7cd7dc1520076e08ea0180591174122e52f3
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
