FROM node:16.18.1-alpine3.16@sha256:868e2b6c8923d87a4bbfb157d757898061c9000aaaedf64472074fa7b62d0e72
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
