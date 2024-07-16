FROM alpine:3.20.0

RUN apk add --no-cache musl-locales \
    musl-locales-lang \
    tzdata \
    openssl \
    wget \
    ca-certificates \
    && update-ca-certificates

RUN apk add --no-cache frp\
    && rm -rfv /usr/bin/frpc /etc/frp/frpc.toml

ENTRYPOINT ["/usr/bin/frps"]

CMD ["-c", "/etc/frp/frps.toml"]
