FROM node:22.22.2-alpine3.22@sha256:7ca86b26185d5e50eb42b95833373df9f8551f3b40dcda8c6425bceadcc9136c
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
