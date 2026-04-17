FROM node:22.22.2-alpine3.22@sha256:c19ea3cfcdb88ea9a85ec6e4e50489feabbad7e9ada438cb251217a2af83da4b
RUN apk -U upgrade --available
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
