FROM node:16.17.0-alpine3.15@sha256:a60b681e1c28f60ea63f8394dea5384c69bdc464b9655e880f74aafaa5945665
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
