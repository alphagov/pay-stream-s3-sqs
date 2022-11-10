FROM node:19.0.1-alpine3.16@sha256:00c5c0850a48bbbf0136f1c886bad52784f9816a8d314a99307d734598359ed4
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
