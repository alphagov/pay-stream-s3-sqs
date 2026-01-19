FROM node:22.22.0-alpine3.22@sha256:0c49915657c1c77c64c8af4d91d2f13fe96853bbd957993ed00dd592cbecc284
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
