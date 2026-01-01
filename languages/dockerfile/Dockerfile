# syntax=docker/dockerfile:1.7
# Hello world, Dockerfile edition: a tour of the syntax.
ARG NODE_VERSION=24
FROM node:${NODE_VERSION}-alpine AS build

LABEL org.opencontainers.image.title="hello-world" \
      org.opencontainers.image.version="1.0.0"

ENV NODE_ENV=production \
    PORT=8080

WORKDIR /app

COPY package.json pnpm-lock.yaml ./
RUN --mount=type=cache,target=/root/.local/share/pnpm \
    corepack enable && pnpm install --frozen-lockfile

COPY . .
RUN pnpm build && echo "built at $(date)" > /app/BUILD_INFO

FROM nginx:1.27-alpine AS runtime
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080 8443
VOLUME ["/var/cache/nginx"]
USER nginx
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://localhost:8080/ || exit 1
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
