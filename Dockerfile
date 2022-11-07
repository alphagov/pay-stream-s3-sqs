FROM node:16.17.1-alpine3.16@sha256:36a2210b84cde8351597b420896d4dc071bfe5fb64552b60516422a768f90e9d
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
