FROM node:16.20.2-alpine3.17@sha256:bbc110afcd56dea9d27969ce1c3585aac53192ad14b364b6c5cb1f25a144ad9f
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
