FROM node:17.8.0-alpine3.15@sha256:0f923922724e7d04a699ceb7b92b8383ec093b4e249804c8bd94886426443bff
COPY package.json package-lock.json ./
RUN npm ci --no-progress
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
