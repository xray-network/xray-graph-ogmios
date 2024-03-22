<a href="https://discord.gg/WhZmm46APN"><img alt="Discord" src="https://img.shields.io/discord/852538978946383893?style=for-the-badge&logo=discord&label=Discord&labelColor=%231940ED&color=%233FCB9B"></a>

# XRAY | Graph | Ogmios — Cardano Node Ogmios Docker Compose Stack

> [!NOTE]
> Ogmios (Cardano Node) stack for XRAY | Network ecosystem needs

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

Default

``` console
docker compose up -d
```

</details>
  
<details>
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
  
<details>
  <summary><b>PREVIEW</b></summary>

Default

``` console
NETWORK=preview docker compose up -d
```

Advanced usage (ports mapping, containers name change)

``` console
NETWORK=preview \
CARDANO_NODE_PORT=3002 \
OGMIOS_PORT=1339 \
docker compose -p preview up -d
```

</details>

## Endpoints List

* Ogmios — https://ogmios.dev/api/

## Advanced Usage
<details>
  <summary>Topology</summary>

If you need to specify which connections the Cardano Node should establish (useful if you are using node as a relay) - edit the [config/cardano-node-ogmios/topology.json](https://github.com/xray-network/xray-graph-ogmios/blob/main/config/cardano-node-ogmios/topology.json) file before run the `docker compose up` command.

</details>
