FROM node:16.20.0-alpine3.17@sha256:01b4c77bab0eec8c12c15ca96d1da583ee61d3bd710432d6fa5d0bf9132ae5e0
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
