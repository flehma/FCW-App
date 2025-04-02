
# --- Base Stage ---
FROM node:22.14 AS base
ARG PORT=3000
WORKDIR /src

# --- Build Stage ---
FROM base AS build
COPY package.json package-lock.json ./
RUN npm ci
COPY --link . .
RUN npm run build

# --- Production Stage ---
FROM base AS production
ENV PORT=$PORT
ENV NODE_ENV=production
COPY --from=build /src/.output /src/.output
CMD [ "node", ".output/server/index.mjs" ]
