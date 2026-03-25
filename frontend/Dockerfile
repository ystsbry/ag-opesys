FROM node:20-slim

WORKDIR /app/frontend

COPY frontend/package*.json ./
RUN npm install

COPY frontend/ .

EXPOSE 3000
