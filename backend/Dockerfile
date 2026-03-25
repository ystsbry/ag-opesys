FROM node:20-slim

WORKDIR /app/backend

RUN npm install -g wrangler

COPY backend/package*.json ./
RUN npm install

COPY backend/ .

EXPOSE 8787
