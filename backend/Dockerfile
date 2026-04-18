# ---- dev stage (used by docker compose) ----
FROM node:24-slim AS dev

ARG UID=1000
ARG GID=1000

RUN groupmod -g ${GID} node && usermod -u ${UID} -g ${GID} node

WORKDIR /app/backend

COPY backend/package*.json ./
RUN npm install && chown -R node:node /app

USER node

EXPOSE 8787

# ---- builder stage (compiles TS for production) ----
FROM node:24-slim AS builder

WORKDIR /app/backend

COPY backend/package*.json ./
RUN npm ci

COPY backend/ ./
RUN npm run build

# ---- runner stage (Cloud Run runtime) ----
FROM node:24-slim AS runner

ENV NODE_ENV=production

WORKDIR /app/backend

COPY backend/package*.json ./
RUN npm ci --omit=dev

COPY --from=builder --chown=node:node /app/backend/dist ./dist

USER node

ENV PORT=8080
EXPOSE 8080

CMD ["node", "dist/index.js"]
