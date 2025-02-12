#!/usr/bin/env bash
set -ex
ENV=prod
NAMESPACE=mainnet
LIVE_VERSION=$(curl -s https://${ENV}-${NAMESPACE}.${ENV}.findora.org:8668/version | awk -F\  '{print $2}')
FINDORAD_IMG=findoranetwork/findorad:${LIVE_VERSION}

export ROOT_DIR=/data/findora/${NAMESPACE}

######################
# Update Config File #
######################

sed -i 's/timeout_propose = "8s"/timeout_propose = "3s"/g' /data/findora/mainnet/tendermint/config/config.toml
sed -i 's/timeout_propose_delta = "100ms"/timeout_propose_delta = "500ms"/g' /data/findora/mainnet/tendermint/config/config.toml

sed -i 's/timeout_prevote = "4s"/timeout_prevote = "1s"/g' /data/findora/mainnet/tendermint/config/config.toml
sed -i 's/timeout_prevote_delta = "100ms"/timeout_prevote_delta = "500ms"/g' /data/findora/mainnet/tendermint/config/config.toml

sed -i 's/timeout_precommit = "4s"/timeout_precommit = "1s"/g' /data/findora/mainnet/tendermint/config/config.toml
sed -i 's/timeout_precommit_delta = "100ms"/timeout_precommit_delta = "500ms"/g' /data/findora/mainnet/tendermint/config/config.toml

###################
# Run local node #
###################
# remove the exist addrbook file
docker stop findorad || exit 1
docker rm findorad || exit 1
rm -rf "${ROOT_DIR}/tendermint/config/addrbook.json"
docker run -d \
    -v ${ROOT_DIR}/tendermint:/root/.tendermint \
    -v ${ROOT_DIR}/findorad:/tmp/findora \
    -p 8669:8669 \
    -p 8668:8668 \
    -p 8667:8667 \
    -p 8545:8545 \
    -p 26657:26657 \
    -e EVM_CHAIN_ID=2152 \
    --name findorad \
    ${FINDORAD_IMG} node \
    --ledger-dir /tmp/findora \
    --tendermint-host 0.0.0.0 \
    --tendermint-node-key-config-path="/root/.tendermint/config/priv_validator_key.json" \
    --enable-query-service \
    --enable-eth-api-service

sleep 10

curl 'http://localhost:26657/status'; echo
curl 'http://localhost:8669/version'; echo
curl 'http://localhost:8668/version'; echo
curl 'http://localhost:8667/version'; echo

echo "Local node initialized, please stake your FRA tokens after syncing is completed."