FROM caddy:2.6.3-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/zorck97/caddy-tailscale

FROM caddy:2.6.3-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile
COPY site /srv