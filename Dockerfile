FROM node:16.20.1-alpine3.17@sha256:77e07be8ecf734e337b1b7d8eaa44abcb87320decffc030ad073354e609aa951
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
