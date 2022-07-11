FROM node:18.5.0-alpine3.15@sha256:5ad62659f793e0194c632cfdeeb9a5f052d241a648d2cfba56f8c05497bf5b5f
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
