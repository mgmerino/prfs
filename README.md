# prfs

Dockerized [frp](https://github.com/fatedier/frp) server (frps) setup with templated configuration.

## Prerequisites

- Docker and Docker Compose
- `envsubst` (from `gettext`) for generating config files

## Environment Variables

### Server (frps)

| Variable | Description |
|---|---|
| `PRFS_BIND_PORT` | Port frps listens on for client connections |
| `PRFS_VHOST_HTTP_PORT` | Port for HTTP virtual host proxying |
| `PRFS_AUTH_TOKEN` | Shared authentication token |

### Client (frpc)

| Variable | Description |
|---|---|
| `PRFS_HOST` | Address of the frps server |
| `PRFS_BIND_PORT` | Server bind port (must match server) |
| `PRFS_AUTH_TOKEN` | Shared authentication token (must match server) |
| `PRFC_SERVICE_NAME` | Name of the proxied service |
| `PRFC_SERVICE_TYPE` | Proxy type (e.g. `tcp`, `http`) |
| `PRFC_LOCAL_IP` | Local IP of the service to expose |
| `PRFC_LOCAL_PORT` | Local port of the service to expose |
| `PRFC_REMOTE_PORT` | Remote port to map to on the server |

## Usage

1. **Generate config files** from templates:

   ```sh
   make env_subst
   ```

   This renders `config/frps.toml` and `config/frpc.toml` from their `.tpl` counterparts.

2. **Start the server**:

   ```sh
   docker compose up -d
   ```

3. **Clean** generated config files:

   ```sh
   make clean
   ```

## Nginx

An example nginx reverse proxy config is provided in `prfs.domain.xyz.conf`, forwarding traffic to the frps vhost HTTP port on `localhost:5103`.
