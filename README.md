# XRAY | Graph | Ogmios — Cardano Node Ogmios Docker Compose Stack

Ogmios (Cardano Node) stack for XRAY | Network ecosystem needs

## Getting Started
``` console
git clone \
  --recurse-submodules \
  https://github.com/xray-network/xray-graph-ogmios.git \
  && cd xray-graph-ogmios
```

``` console
cp .env.example .env
```

<details open>
  <summary><b>MAINNET</b></summary>

``` console
docker compose up -d
```

</details>
  
<details open>
  <summary><b>PREPROD</b></summary>

Default

``` console
NETWORK=preprod docker compose up -d
```

Advanced usage (ports mapping, containers name change)

``` console
NETWORK=preprod \
CARDANO_NODE_PORT=3001 \
OGMIOS_PORT=1338 \
docker compose -p preprod up -d
```

</details>
  
<details open>
  <summary><b>PREVIEW</b></summary>

``` console
NETWORK=preview docker compose up -d
```

``` console
NETWORK=preview \
CARDANO_NODE_PORT=3002 \
OGMIOS_PORT=1339 \
docker compose -p preview up -d
```

</details>

> The default configuration has an SSL key set at `/etc/ssl/xrey.pem`. You can disable it in `config/haproxy/haproxy.cfg`.

> The default configuration contains a custom `config/cardano-node-ogmios/topology.json` file for simply adding XRAY block producers in the `mainnet` network (`xray-graph-ogmios` works as a relay). Comment out the line with this file in `docker-compose.yml` if you are using a network other than `mainnet`.

## Endpoints List

* Ogmios — https://ogmios.dev/api/

## Advanced Usage
<details>
  <summary>Topology</summary>

If you need to specify which connections the Cardano Node should establish (useful if you are using node as a relay) - edit the [topology.json](https://github.com/xray-network/xray-graph-ogmios/blob/main/topology.json) file before run the `docker compose up` command.

</details>
