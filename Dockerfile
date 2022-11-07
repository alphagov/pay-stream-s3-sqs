FROM node:19.0.0-alpine3.16@sha256:1a04e2ec39cc0c3a9657c1d6f8291ea2f5ccadf6ef4521dec946e522833e87ea
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
