FROM node:16.17.1-alpine3.15@sha256:fb784316e40086079e1118be238dafd5c83c3d42b9297fd289bf25637544f786
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
