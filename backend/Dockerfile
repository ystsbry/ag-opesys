FROM node:24-slim

ARG UID=1000
ARG GID=1000

RUN groupmod -g ${GID} node && usermod -u ${UID} -g ${GID} node

WORKDIR /app/backend

COPY backend/package*.json ./
RUN npm install && chown -R node:node /app

USER node

EXPOSE 8787
