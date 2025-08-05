FROM node:22.18.0-alpine3.21@sha256:2286e35d4e89a5424327b9bf9fcb1f85899dcfdcc92141b6d56d2ddb2fc0182b
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
