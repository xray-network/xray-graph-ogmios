<a href="https://discord.gg/WhZmm46APN"><img alt="Discord" src="https://img.shields.io/discord/852538978946383893?style=for-the-badge&logo=discord&label=Discord&labelColor=%231940ED&color=%233FCB9B"></a>

# XRAY/Graph Ogmios — Dockerized Ogmios stack

XRAY/Graph Ogmios is a tool for fast and predictable deployment of [Haproxy](https://www.haproxy.org/) (TCP/HTTP Load Balancer), and [Ogmios](https://ogmios.dev) (Cardano Node) stack in a docker environment. Used in the [XRAY/Graph](https://xray.app/) distributed Cardano API provider.

## Getting Started
### Prepare Installation

``` console
git clone \
  --recurse-submodules \
  https://github.com/xray-network/xray-graph-ogmios.git \
  && cd xray-graph-ogmios
```

``` console
cp .env.example .env
```

### Build and Run via Docker Compose

> You can combine profiles to run multiple networks on the same machine: `docker compose --profile mainnet --profile preprod --profile preview up -d`

<details open>
  <summary><b>MAINNET</b></summary>

``` console
docker compose --profile mainnet up -d
```

</details>
  
<details>
  <summary><b>PREPROD</b></summary>

``` console
docker compose --profile preprod up -d
```

</details>
  
<details>
  <summary><b>PREVIEW</b></summary>

``` console
docker compose --profile preview up -d
```

</details>

## Endpoints List

* Ogmios — https://ogmios.dev/api/

## Advanced Usage
<details>
  <summary>Topology</summary>

If you need to specify which connections the Cardano Node should establish (useful if you are using node as a relay) - edit the [config/cardano-node-ogmios/mainnet/topology.json](https://github.com/xray-network/xray-graph-ogmios/blob/main/config/cardano-node-ogmios/mainnet/topology.json) file before run the `docker compose up` command.

</details>
