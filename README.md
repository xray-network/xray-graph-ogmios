<a href="https://discord.gg/WhZmm46APN"><img alt="Discord" src="https://img.shields.io/discord/852538978946383893?style=for-the-badge&logo=discord&label=Discord&labelColor=%231940ED&color=%233FCB9B"></a>

# XRAY/Graph Ogmios — Dockerized Ogmios

XRAY/Graph Ogmios is a tool for fast and predictable deployment of [Ogmios](https://ogmios.dev) (Cardano Node) stack in a docker environment. Used in the [XRAY/Graph](https://xray.app/) distributed Cardano API provider.

## Getting Started

### Prepare Installation

``` console
git clone \
  --recurse-submodules \
  https://github.com/xray-network/xray-graph-ogmios.git \
  && cd xray-graph-ogmios
```

### MAINNET

``` console
NETWORK=mainnet \
docker compose -f docker-compose.yaml -p ogmios-mainnet up -d --build
```

### PREPROD

``` console
NETWORK=preprod \
OGMIOS_PORT=1338 \
CARDANO_PORT=3001 \
RAPIDOC_OGMIOS_PORT=2501 \
docker compose -f docker-compose.yaml -p ogmios-preprod up -d --build
```

### PREVIEW

``` console
NETWORK=preview \
OGMIOS_PORT=1339 \
CARDANO_PORT=3002 \
RAPIDOC_OGMIOS_PORT=2502 \
docker compose -f docker-compose.yaml -p ogmios-preview up -d --build
```



## Advanced Usage

<details>
  <summary>Cardano Node Topology</summary>

If you need to specify which connections the Cardano Node should establish (useful if you are using node as a relay) - edit the [config/cardano-node-ogmios/mainnet/topology.json](https://github.com/xray-network/xray-graph-ogmios/blob/main/config/cardano-node-ogmios/mainnet/topology.json) file before run the `docker compose up` command.

</details>

<details>
  <summary><b>Restoring From Snapshot</b></summary>
  
## Step 0: Installing Dependencies

Installing dependepcies (if needed):
``` console
sudo apt update && sudo apt install zstd jq wget -y
```

## Step 1: Restoring Cardano Node DB

1. Enter root dir:
``` console
cd xray-graph-ogmios
```

2. Run docker compose up (clean run):
  ``` console
NETWORK=mainnet \
docker compose -f docker-compose.yaml -p ogmios-mainnet up -d --build
```

3. Stop cardano-node-ogmios container:
``` console
docker stop *container_id*
```

4. Download lates cardano-node-ogmios db:
``` console
wget -c -O - "https://downloads.csnapshots.io/mainnet/$(wget -qO- https://downloads.csnapshots.io/mainnet/mainnet-db-snapshot.json | jq -r .[].file_name)" | zstd -d -c | tar -x -C ./snapshots
```

5. Get node_db volume id:
``` console
docker volume ls
```

6. Remove cardano-node-ogmios db and copy downloaded:
```
sudo rm -rf /var/lib/docker/volumes/*cardano-node-ogmios_node_db-volume-id*/_data \
sudo mv ./snapshots/db /var/lib/docker/volumes/*cardano-node-ogmios_node_db-volume-id*/_data
```

7. Start cardano-node-ogmios container:

``` console
docker start *container_id*
```

</details>

<details>
  <summary><b>TypeScript Client</b></summary>
  
We recommend to use `cardano-ogmios-client`. Visit [cardano-ogmios-client](https://github.com/xray-network/cardano-ogmios-client) repo for more information.

</details>

<details>
  <summary><b>Using in Graph Cluster (Traefik Reverse Proxy)</b></summary>

1. Clone and run Traefik:
``` console
git clone https://github.com/xray-network/traefik-docker.git \
&& cd traefik-docker \
&& docker compose -up d
```

2. Set `BEARER_RESOLVER_TOKEN` and `docker-compose.xray.yaml`:
``` console
NETWORK=mainnet \
BEARER_RESOLVER_TOKEN=your_access_token \
docker compose -f docker-compose.xray.yaml -p ogmios-mainnet up -d --build
```

</details>

## Documentation

* Ogmios — https://ogmios.dev/
* Ogmios Rapidoc Playground (OpenAPI Schema) — https://graph.xray.app/output/services/ogmios/mainnet/api/v1/
* Ogmios OpenAPI Schema (JSON) — https://graph.xray.app/output/services/ogmios/mainnet/api/v1/openapi.json
* Ogmios TypeScript Client — https://github.com/xray-network/cardano-ogmios-client
* Traefik — https://traefik.io/traefik
