FROM node:18.4.0-alpine3.15@sha256:f55132b48261c7ca0394d71c204eb419db0a0209be341762390693434e4bdd92
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
