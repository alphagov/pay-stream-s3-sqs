FROM node:22.22.1-alpine3.22@sha256:9f96f09f127f06feaff1e7faa4a34a3020cf5c1138c988782e59959641facabe
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
