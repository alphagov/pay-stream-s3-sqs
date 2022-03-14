FROM node:17.7.1-alpine3.15@sha256:8c62619815dd2d7642f9e9c7f30d7016249a41175dfca0aaf248171960e4cc80
COPY package.json package-lock.json ./
RUN npm ci --no-progress
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
