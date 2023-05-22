FROM node:16.20.0-alpine3.17@sha256:b4a72f83f52bbe3970bb74a15e44ec4cf6e873ad4787473dfc8a26f5b4e29dd2
RUN apk upgrade --no-cache
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress && \
		npm run build && \
		npm prune --production
USER node
CMD [ "npm", "start" ]