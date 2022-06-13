FROM node:18.3.0-alpine3.15@sha256:7ab82182ec72ea2042e29f40fd2d7badf3023302928600803e2c158be85aee94
COPY package.json package-lock.json ./
COPY src/ src
COPY tsconfig.json tsconfig.json
RUN npm ci --no-progress
RUN npm run build
RUN npm prune --production
USER node
CMD [ "npm", "start" ]
