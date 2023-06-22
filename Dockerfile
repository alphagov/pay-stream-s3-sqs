FROM node:16.20.1-alpine3.17@sha256:b1fdeade9cae98c30bbd8087f26f8da404e6fc48bdd53772017855c1a1d32605
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
