FROM node:16.19.0-alpine3.16@sha256:e023c53915c5e20df594809477dc249dd595a8e731a6e214c4dbdcf7431bf942
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
