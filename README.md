# XRAY | Graph | Ogmios — Cardano Node Ogmios Docker Compose Stack

Ogmios (Cardano Node) stack for XRAY | Network ecosystem needs

## Getting Started
``` console
git clone \
  --recurse-submodules \
  https://github.com/ray-network/xray-graph-ogmios.git \
  && cd xray-graph-ogmios
```

<details open>
  <summary><b>mainnet</b></summary>

``` console
docker compose up -d
```

</details>
  
<details open>
  <summary><b>preprod</b></summary>

``` console
NETWORK=preprod \
CARDANO_NODE_PORT=3001 \
OGMIOS_PORT=1338 \
docker compose -p preprod up -d --build
```

</details>
  
<details open>
  <summary><b>preview</b></summary>

``` console
NETWORK=preview \
CARDANO_NODE_PORT=3002 \
OGMIOS_PORT=1339 \
docker compose -p preview up -d --build
```

</details>

> The default configuration has an SSL key set at `/etc/ssl/xrey.pem`. You can disable it in `config/haproxy/haproxy.cfg`.

## Advanced Usage
<details>
  <summary>Topology</summary>

If you need to specify which connections the Cardano Node should establish (useful if you are using node as a relay) - edit the [topology.json](https://github.com/ray-network/xray-graph-ogmios/blob/main/config/cardano-node-ogmios/topology.json) file before run the `docker compose up` command.

</details>

<details>
  <summary>HAProxy</summary>

By default, all container ports are bound to 127.0.0.1, so these ports are not available outside the server. Replace `127.0.0.1:${OGMIOS_PORT:-8050}:8050` with `${OGMIOS_PORT:-8050}:8050` if you want to open ports for external access.

Routes are resolved using the `HostResolver` header (this is needed for [XRAY | Graph | Output Load Balancer](https://github.com/ray-network/cloudflare-worker-output-load-balancer)). 

Also, time limits on server requests can be disabled (or rather, increased from 30 seconds to 60 minutes) by setting `HAPROXY_JWT_BEARER_TOKEN` in the `.env` file and then passing it over the `BearerResolver` header.

The path to SSL PEM key can be found here `/etc/ssl/xray.pem/`.

Check configuration file here [haproxy.cfg](https://github.com/ray-network/xray-graph-kupmios/blob/main/config/haproxy/haproxy.cfg).

</details>


  
