FROM node:17.5.0-alpine3.15@sha256:0e83c810225bc29e614189acf3d6419e3c09881cefb9f7a170fdcfe3e15bbfd5
COPY package.json package-lock.json ./
RUN npm ci --no-progress
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
