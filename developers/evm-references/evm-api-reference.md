# EVM API Reference

### Web3 JSON-RPC protocol[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#web3-json-rpc-protocol) <a href="#web3-json-rpc-protocol" id="web3-json-rpc-protocol"></a>

#### eth\_protocolVersion[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_protocolversion) <a href="#eth_protocolversion" id="eth_protocolversion"></a>

Returns the current findora protocol version.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters)

none

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns)

`String` - The current ethereum protocol version

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example)

Request

```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_protocolVersion","params":[],"id":1,"jsonrpc":"2.0"}'
```

Response

```json
{
  "id": 1,
  "jsonrpc": "2.0",
  "result": "54"
}
```

#### eth\_chainId[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_chainid) <a href="#eth_chainid" id="eth_chainid"></a>

Returns the current findora chain ID

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-1)

none

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-1)

`String` - The current findora chain ID

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-1)

Request

```bash
curl localhost:8545
-X POST
-H "Content-Type: application/json"
--data '{"method":"eth_chainId","params":[],"id":1,"jsonrpc":"2.0"}'
```

Response

```json
{
  "id": 1,
  "jsonrpc": "2.0",
  "result": "0x869" # 2153
}
```

#### eth\_accounts[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_accounts) <a href="#eth_accounts" id="eth_accounts"></a>

Returns a list of addresses owned by client.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-2)

none

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-2)

`Array` - 20 Bytes - addresses owned by the client.

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-2)

Request

```bash
curl localhost:8545 \
    -X POST \
    -H "Content-Type: application/json" \
    -d '{"jsonrpc":"2.0","method":"eth_accounts","params":[],"id":1}'
```

Response

```bash
{
  "id": 1,
  "jsonrpc": "2.0",
  "result": ["0x407d73d8a49eeb85d32cf465507dd71d507100c1"]
}
```

#### eth\_getBalance[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_getbalance) <a href="#eth_getbalance" id="eth_getbalance"></a>

Returns a list of addresses owned by client.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-3)

1. `Address` - 20 Bytes - address to check for balance.
2. `Quantity or Tag` - (optional) Integer block number, or the string 'latest', 'earliest' or 'pending'.

```json
params: ["0x407d73d8a49eeb85d32cf465507dd71d507100c1"]
```

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-3)

`Quantity` - integer of the current balance in wei.

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-3)

Request

```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_getBalance","params":["0x8D97689C9818892B700e27F316cc3E41e17fBeb9", "latest"],"id":1,"jsonrpc":"2.0"}'
```

Response

```json
{
  "id": 1,
  "jsonrpc": "2.0",
  "result": "0x0234c8a3397aab58"
}
```

#### eth\_sendTransaction[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_sendtransaction) <a href="#eth_sendtransaction" id="eth_sendtransaction"></a>



Creates new message call transaction or a contract creation, if the data field contains code.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-4)

1. `Object` - The transaction object
   * `from`: `Address` - 20 Bytes - The address the transaction is send from.
   * `to`: `Address` - (optional) 20 Bytes - The address the transaction is directed to.
   * `gas`: `Quantity` - (optional) Integer of the gas provided for the transaction execution. eth\_call consumes zero gas, but this parameter may be needed by some executions.
   * `gasPrice`: `Quantity` - (optional) Integer of the gas price used for each paid gas.
   * `value`: `Quantity` - (optional) Integer of the value sent with this transaction.
   * `data`: `Data` - (optional) 4 byte hash of the method signature followed by encoded parameters. For details see Ethereum Contract ABI.
   * `nonce`: `Quantity` - (optional) Integer of a nonce. This allows to overwrite your own pending transactions that use the same nonce.
   * `condition`: `Object` - (optional) Conditional submission of the transaction. Can be either an integer block number { block: 1 } or UTC timestamp (in seconds) { time: 1491290692 } or null.

```json
params: [{
  "from": "0xb60e8dd61c5d32be8058bb8eb970870f07233155",
  "to": "0xd46e8dd67c5d32be8058bb8eb970870f07244567",
  "gas": "0x76c0", // 30400
  "gasPrice": "0x9184e72a000", // 10000000000000
  "value": "0x9184e72a", // 2441406250
  "data": "0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675"
}]
```

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-4)

`Hash` - 32 Bytes - the transaction hash, or the zero hash if the transaction is not yet available.

Use eth\_getTransactionReceipt to get the contract address, after the transaction was mined, when you created a contract.

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-4)

Request

{% code overflow="wrap" %}
```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_sendTransaction","params":[{"from":"0xb60e8dd61c5d32be8058bb8eb970870f07233155","to":"0xd46e8dd67c5d32be8058bb8eb970870f07244567","gas":"0x76c0","gasPrice":"0x9184e72a000","value":"0x9184e72a","data":"0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675"}],"id":1,"jsonrpc":"2.0"}'
```
{% endcode %}

Response

```json
{
  "id": 1,
  "jsonrpc": "2.0",
  "result": "0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331"
}
```

[back to top](evm-api-reference.md)

#### eth\_call[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_call) <a href="#eth_call" id="eth_call"></a>



Creates new message call transaction or a contract creation, if the data field contains code.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-5)

1. `Object` - The transaction call object
   * `from`: `Address` - 20 Bytes - The address the transaction is send from.
   * `to`: `Address` - (optional) 20 Bytes - The address the transaction is directed to.
   * `gas`: `Quantity` - (optional) Integer of the gas provided for the transaction execution. eth\_call consumes zero gas, but this parameter may be needed by some executions.
   * `gasPrice`: `Quantity` - (optional) Integer of the gas price used for each paid gas.
   * `value`: `Quantity` - (optional) Integer of the value sent with this transaction.
   * `data`: `Data` - (optional) 4 byte hash of the method signature followed by encoded parameters. For details see Ethereum Contract ABI.
2. `Quantity` or `Tag` - (optional) Integer block number, or the string 'latest', 'earliest' or 'pending'.

{% code overflow="wrap" %}
```json
params: [{
  "from": "0x407d73d8a49eeb85d32cf465507dd71d507100c1",
  "to": "0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b",
  "value": "0x186a0" // 100000
}]
```
{% endcode %}

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-5)

`Data` - the return value of executed contract.

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-5)

Request

{% code overflow="wrap" %}
```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_call","params":[{"from":"0x407d73d8a49eeb85d32cf465507dd71d507100c1","to":"0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b","value":"0x186a0"}],"id":1,"jsonrpc":"2.0"}'
```
{% endcode %}

Response

```json
{
  "id": 1,
  "jsonrpc": "2.0",
  "result": "0x"
}
```

[back to top](evm-api-reference.md)

#### eth\_coinbase[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_coinbase) <a href="#eth_coinbase" id="eth_coinbase"></a>



Returns the client coinbase address.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-6)

none

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-6)

`Data` - 20 bytes - the current coinbase address.

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-6)

Request

{% code overflow="wrap" %}
```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"eth_coinbase","params":[],"id":1}'
```
{% endcode %}

Response

{% code overflow="wrap" %}
```json
{
  "id":64,
  "jsonrpc": "2.0",
  "result": "0x407d73d8a49eeb85d32cf465507dd71d507100c1"
}
```
{% endcode %}

[back to top](evm-api-reference.md)

#### eth\_gasPrice[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_gasprice) <a href="#eth_gasprice" id="eth_gasprice"></a>



Returns the current price per gas in wei.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-7)

none

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-7)

`Quantity` - integer of the current gas price in wei.

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-7)

Request

{% code overflow="wrap" %}
```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_gasPrice","params":[],"id":1,"jsonrpc":"2.0"}'
```
{% endcode %}

Response

{% code overflow="wrap" %}
```json
{
  "id": 1,
  "jsonrpc": "2.0",
  "result": "0x9184e72a000" // 10000000000000
}
```
{% endcode %}

[back to top](evm-api-reference.md)

#### eth\_blockNumber[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_blocknumber) <a href="#eth_blocknumber" id="eth_blocknumber"></a>

Returns the number of the most recent block.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-8)

none

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-8)

`Quantity` - integer of the current block number the client is on.

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-8)

Request

{% code overflow="wrap" %}
```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_blockNumber","params":[],"id":1,"jsonrpc":"2.0"}'
```
{% endcode %}

Response

{% code overflow="wrap" %}
```bash
{
  "id": 1,
  "jsonrpc": "2.0",
  "result": "0x4b7" // 1207
}
```
{% endcode %}

[back to top](evm-api-reference.md)

#### eth\_getStorageAt[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_getstorageat) <a href="#eth_getstorageat" id="eth_getstorageat"></a>



Returns the value from a storage position at a given address.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-9)

1. `Address` - 20 Bytes - address of the storage.
2. `Quantity` - integer of the position in the storage.
3. `Quantity` or `Tag` - (optional) integer block number, or the string 'latest', 'earliest' or 'pending'.

{% code overflow="wrap" %}
```json
params: [
  "0x407d73d8a49eeb85d32cf465507dd71d507100c1",
  "0x0", // 0
  "0x2" // 2
]
```
{% endcode %}

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-9)

`Data` - the value at this storage position.

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-9)

Request

{% code overflow="wrap" %}
```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_getStorageAt","params":["0x407d73d8a49eeb85d32cf465507dd71d507100c1","0x0","0x2"],"id":1,"jsonrpc":"2.0"}'
```
{% endcode %}

Response

{% code overflow="wrap" %}
```json
{
  "id": 1,
  "jsonrpc": "2.0",
  "result": "0x0000000000000000000000000000000000000000000000000000000000000003"
}
```
{% endcode %}

[back to top](evm-api-reference.md)

#### eth\_getBlockByHash[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_getblockbyhash) <a href="#eth_getblockbyhash" id="eth_getblockbyhash"></a>



Returns information about a block by hash.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-10)

1. `Data` - 32 Bytes - Hash of a block
2. `Boolean` - If true it returns the full transaction objects, if false only the hashes of the transactions.

```json
params: [
   '0xdc0818cf78f21a8e70579cb46a43643f78291264dda342ae31049421c82d21ae',
   false
]
```

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-10)

`Object` - A block object, or `null` when no block was found:

* `number`: `QUANTITY` - the block number. null when its pending block.
* `hash`: `DATA`, 32 Bytes - hash of the block. null when its pending block.
* `parentHash`: `DATA`, 32 Bytes - hash of the parent block.
* `nonce`: `DATA`, 8 Bytes - hash of the generated proof-of-work. null when its pending block.
* `sha3Uncles`: `DATA`, 32 Bytes - SHA3 of the uncles data in the block.
* `logsBloom`: `DATA`, 256 Bytes - the bloom filter for the logs of the block. null when its pending block.
* `transactionsRoot`: `DATA`, 32 Bytes - the root of the transaction trie of the block.
* `stateRoot`: `DATA`, 32 Bytes - the root of the final state trie of the block.
* `receiptsRoot`: `DATA`, 32 Bytes - the root of the receipts trie of the block.
* `miner`: `DATA`, 20 Bytes - the address of the beneficiary to whom the mining rewards were given.
* `difficulty`: `QUANTITY` - integer of the difficulty for this block.
* `totalDifficulty`: `QUANTITY` - integer of the total difficulty of the chain until this block.
* `extraData`: `DATA` - the “extra data” field of this block.
* `size`: `QUANTITY` - integer the size of this block in bytes.
* `gasLimit`: `QUANTITY` - the maximum gas allowed in this block.
* `gasUsed`: `QUANTITY` - the total used gas by all transactions in this block.
* `timestamp`: `QUANTITY` - the unix timestamp for when the block was collated.
* `transactions`: `Array` - Array of transaction objects, or 32 Bytes transaction hashes depending on the last given parameter.
* `uncles`: `Array` - Array of uncle hashes.

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-10)

Request

{% code overflow="wrap" %}
```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"eth_getBlockByHash","params":["0xdc0818cf78f21a8e70579cb46a43643f78291264dda342ae31049421c82d21ae", false],"id":1}'
```
{% endcode %}

Response

{% code overflow="wrap" %}
```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    "difficulty": "0x4ea3f27bc",
    "extraData": "0x476574682f4c5649562f76312e302e302f6c696e75782f676f312e342e32",
    "gasLimit": "0x1388",
    "gasUsed": "0x0",
    "hash": "0xdc0818cf78f21a8e70579cb46a43643f78291264dda342ae31049421c82d21ae",
    "logsBloom": "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    "miner": "0xbb7b8287f3f0a933474a79eae42cbca977791171",
    "mixHash": "0x4fffe9ae21f1c9e15207b1f472d5bbdd68c9595d461666602f2be20daf5e7843",
    "nonce": "0x689056015818adbe",
    "number": "0x1b4",
    "parentHash": "0xe99e022112df268087ea7eafaf4790497fd21dbeeb6bd7a1721df161a6657a54",
    "receiptsRoot": "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
    "sha3Uncles": "0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347",
    "size": "0x220",
    "stateRoot": "0xddc8b0234c2e0cad087c8b389aa7ef01f7d79b2570bccb77ce48648aa61c904d",
    "timestamp": "0x55ba467c",
    "totalDifficulty": "0x78ed983323d",
    "transactions": [
    ],
    "transactionsRoot": "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
    "uncles": [
    ]
  }
}
```
{% endcode %}

[back to top](evm-api-reference.md)

#### eth\_getBlockByNumber[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_getblockbynumber) <a href="#eth_getblockbynumber" id="eth_getblockbynumber"></a>



Returns information about a block by hash.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-11)

1. `Quantity` or `Tag` - integer of a block number, or the string 'earliest', 'latest' or 'pending'.
2. `Boolean` - If true it returns the full transaction objects, if false only the hashes of the transactions.

```json
params: [
  "0x1b4", // 436
  true
]
```

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-11)

`Object` - A block object, or `null` when no block was found:

* `number`: `QUANTITY` - the block number. null when its pending block.
* `hash`: `DATA`, 32 Bytes - hash of the block. null when its pending block.
* `parentHash`: `DATA`, 32 Bytes - hash of the parent block.
* `author`: `Address` - 20 Bytes - alias of 'author'
* `miner`: `DATA`, 20 Bytes - the address of the beneficiary to whom the mining rewards were given.
* `gasLimit`: `QUANTITY` - the maximum gas allowed in this block.
* `gasUsed`: `QUANTITY` - the total used gas by all transactions in this block.
* `timestamp`: `QUANTITY` - the unix timestamp for when the block was collated.
* `transactions`: `Array` - Array of transaction objects, or 32 Bytes transaction hashes depending on the last given parameter.

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-11)

Request

{% code overflow="wrap" %}
```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_getBlockByNumber","params":["0x1b4",true],"id":1,"jsonrpc":"2.0"}'
```
{% endcode %}

Response

{% code overflow="wrap" %}
```json
{
  "id": 1,
  "jsonrpc": "2.0",
  "result": {
    "number": "0x1b4", // 436
    "hash": "0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331",
    "parentHash": "0x9646252be9520f6e71339a8df9c55e4d7619deeb018d2a3f2d21fc165dde5eb5",
    "sealFields": [
      "0xe04d296d2460cfb8472af2c5fd05b5a214109c25688d3704aed5484f9a7792f2",
      "0x0000000000000042"
    ],
    "sha3Uncles": "0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347",
    "logsBloom": "0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331",
    "transactionsRoot": "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
    "stateRoot": "0xd5855eb08b3387c0af375e9cdb6acfc05eb8f519e419b874b6ff2ffda7ed1dff",
    "miner": "0x4e65fda2159562a496f9f3522f89122a3088497a",
    "difficulty": "0x27f07", // 163591
    "totalDifficulty": "0x27f07", // 163591
    "extraData": "0x0000000000000000000000000000000000000000000000000000000000000000",
    "size": "0x27f07", // 163591
    "gasLimit": "0x9f759", // 653145
    "minGasPrice": "0x9f759", // 653145
    "gasUsed": "0x9f759", // 653145
    "timestamp": "0x54e34e8e", // 1424182926
    "transactions": [{ ... }, { ... }, ...],
    "uncles": [
      "0x1606e5...",
      "0xd5145a9..."
    ]
  }
}
```
{% endcode %}

[back to top](evm-api-reference.md)

#### eth\_getTransactionCount[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_gettransactioncount) <a href="#eth_gettransactioncount" id="eth_gettransactioncount"></a>



Returns the number of transactions sent from an address.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-12)

1. `Address` - 20 Bytes - address
2. `Quantity` or `Tag` - (optional) integer block number, or the string 'latest', 'earliest' or 'pending'.

```json
params: ["0x407d73d8a49eeb85d32cf465507dd71d507100c1"]
```

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-12)

`Quantity` - integer of the number of transactions send from this address.

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-12)

Request

{% code overflow="wrap" %}
```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_getTransactionCount","params":["0x407d73d8a49eeb85d32cf465507dd71d507100c1"],"id":1,"jsonrpc":"2.0"}'
```
{% endcode %}

Response

```json
{
  "id": 1,
  "jsonrpc": "2.0",
  "result": "0x1" // 1
}
```

[back to top](evm-api-reference.md)

#### eth\_getBlockTransactionCountByHash[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_getblocktransactioncountbyhash) <a href="#eth_getblocktransactioncountbyhash" id="eth_getblocktransactioncountbyhash"></a>



Returns the number of transactions in a block from a block matching the given block hash.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-13)

1. `Hash` - 32 Bytes - hash of a block

```json
params: ["0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238"]
```

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-13)

`Quantity` - integer of the number of transactions in this block.

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-13)

Request

{% code overflow="wrap" %}
```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_getBlockTransactionCountByHash","params":["0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238"],"id":1,"jsonrpc":"2.0"}'
```
{% endcode %}

Response

```json
{
  "id": 1,
  "jsonrpc": "2.0",
  "result": "0xb" // 11
}
```

[back to top](evm-api-reference.md)

#### eth\_getBlockTransactionCountByNumber[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_getblocktransactioncountbynumber) <a href="#eth_getblocktransactioncountbynumber" id="eth_getblocktransactioncountbynumber"></a>



Returns the number of transactions in a block matching the given block number.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-14)

1. `Quantity` or `Tag` - (optional) integer block number, or the string 'latest', 'earliest' or 'pending'.

```json
params: [   '0xe8', // 232]
```

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-14)

`Quantity` - integer of the number of transactions in this block.

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-14)

Request

{% code overflow="wrap" %}
```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"eth_getBlockTransactionCountByNumber","params":["0xe8"],"id":1}'
```
{% endcode %}

Response

```json
{
  "id": 1,
  "jsonrpc": "2.0",
  "result": "0xa" // 10
}
```

[back to top](evm-api-reference.md)

#### eth\_getCode[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_getcode) <a href="#eth_getcode" id="eth_getcode"></a>



Returns code at a given address

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-15)

1. `Address` - 20 bytes - address
2. `Quantity` or `Tag` - (optional) integer block number, or the string 'latest', 'earliest' or 'pending'.

```json
params: [
   '0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b',
   '0x2'  // 2
]
```

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-15)

`Data` - the code from the given address.

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-15)

Request

{% code overflow="wrap" %}
```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"eth_getCode","params":["0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b", "0x2"],"id":1}
```
{% endcode %}

Response

{% code overflow="wrap" %}
```json
{
  "id":1,
  "jsonrpc": "2.0",
  "result": "0x600160008035811a818181146012578301005b601b6001356025565b8060005260206000f25b600060078202905091905056"
}
```
{% endcode %}

[back to top](evm-api-reference.md)

#### eth\_sendRawTransaction[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_sendrawtransaction) <a href="#eth_sendrawtransaction" id="eth_sendrawtransaction"></a>



Creates new message call transaction or a contract creation for signed transactions.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-16)

1. `Data` - The signed transaction data.

```
params: ["0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675"]
```

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-16)

`Hash` - 32 bytes - the transaction hash, or the zero hash if the transaction is not yet available.

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-16)

Request

{% code overflow="wrap" %}
```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_sendRawTransaction","params":["0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675"],"id":1,"jsonrpc":"2.0"}'
```
{% endcode %}

Response

{% code overflow="wrap" %}
```json
{
  "id": 1,
  "jsonrpc": "2.0",
  "result": "0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331"
}
```
{% endcode %}

[back to top](evm-api-reference.md)

#### eth\_estimateGas[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_estimategas) <a href="#eth_estimategas" id="eth_estimategas"></a>



Makes a call or transaction, which won't be added to the blockchain and returns the used gas, which can be used for estimating the used gas.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-17)

1. `Object` - Same as eth\_call parameters, except that all properties are optional.
   * `from`: `Address` - (optional) 20 Bytes - The address the transaction is send from.
   * `to`: `Address` - (optional when creating new contract) 20 Bytes - The address the transaction is directed to.
   * `gas`: `Quantity` - (optional) Integer of the gas provided for the transaction execution. eth\_call consumes zero gas, but this parameter may be needed by some executions.
   * `gasPrice`: `Quantity` - (optional) Integer of the gas price used for each paid gas.
   * `value`: `Quantity` - (optional) Integer of the value sent with this transaction.
   * `data`: `Data` - (optional) 4 byte hash of the method signature followed by encoded parameters. For details see Ethereum Contract ABI.
2. `Quantity` or `Tag` - (optional) Integer block number, or the string 'latest', 'earliest' or 'pending', see the default block parameter.

{% code overflow="wrap" %}
```json
params: ["0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675"]
```
{% endcode %}

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-17)

`Quantity` - The amount of gas used.

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-17)

Request

{% code overflow="wrap" %}
```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_estimateGas","params":[{ ... }],"id":1,"jsonrpc":"2.0"}'
```
{% endcode %}

Response

{% code overflow="wrap" %}
```json
{
  "id": 1,
  "jsonrpc": "2.0",
  "result": "0x5208" // 21000
}
```
{% endcode %}

[back to top](evm-api-reference.md)

#### eth\_getTransactionByHash[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_gettransactionbyhash) <a href="#eth_gettransactionbyhash" id="eth_gettransactionbyhash"></a>



Returns the information about a transaction requested by transaction hash.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-18)

1. `Hash` - 32 Bytes - hash of a transaction.

{% code overflow="wrap" %}
```json
params: ["0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238"]
```
{% endcode %}

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-18)

1. `Object` - A transaction object, or null when no transaction was found:
   * `hash`: Hash - 32 Bytes - hash of the transaction.
   * `nonce`: `Quantity` - the number of transactions made by the sender prior to this one.
   * `blockHash`: `Hash` - 32 Bytes - hash of the block where this transaction was in. null when its pending.
   * `blockNumber`: `Quantity` or Tag - block number where this transaction was in. null when its pending.
   * `transactionIndex`: `Quantity` - integer of the transactions index position in the block. null when its pending.
   * `from`: `Address` - 20 Bytes - address of the sender.
   * `to`: `Address` - 20 Bytes - address of the receiver. null when its a contract creation transaction.
   * `value`: `Quantity` - value transferred in Wei.
   * `gasPrice`: `Quantity` - gas price provided by the sender in Wei.
   * `gas`: `Quantity` - gas provided by the sender.
   * `input`: `Data` - the data send along with the transaction.
   * `v`: `Quantity` - the standardised V field of the signature.
   * `standardV`: `Quantity` - the standardised V field of the signature (0 or 1).
   * `r`: `Quantity` - the R field of the signature.
   * `raw`: `Data` - raw transaction data
   * `publicKey`: `Hash` - public key of the signer.
   * `chainId`: `Quantity` - the chain id of the transaction, if any.
   * `creates`: `Hash` - creates contract hash
   * `condition`: `Object` - (optional) conditional submission, Block number in block or timestamp in time or null.

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-18)

Request

{% code overflow="wrap" %}
```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_getTransactionByHash","params":["0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238"],"id":1,"jsonrpc":"2.0"}'
```
{% endcode %}

Response

{% code overflow="wrap" %}
```json
{
  "id": 1,
  "jsonrpc": "2.0",
  "result": {
    "hash": "0xc6ef2fc5426d6ad6fd9e2a26abeab0aa2411b7ab17f30a99d3cb96aed1d1055b",
    "nonce": "0x0", // 0
    "blockHash": "0xbeab0aa2411b7ab17f30a99d3cb9c6ef2fc5426d6ad6fd9e2a26a6aed1d1055b",
    "blockNumber": "0x15df", // 5599
    "transactionIndex": "0x1", // 1
    "from": "0x407d73d8a49eeb85d32cf465507dd71d507100c1",
    "to": "0x853f43d8a49eeb85d32cf465507dd71d507100c1",
    "value": "0x7f110", // 520464
    "gas": "0x7f110", // 520464
    "gasPrice": "0x09184e72a000",
    "input": "0x603880600c6000396000f300603880600c6000396000f3603880600c6000396000f360"
  }
}
```
{% endcode %}

[back to top](evm-api-reference.md)

#### eth\_getTransactionByBlockHashAndIndex[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_gettransactionbyblockhashandindex) <a href="#eth_gettransactionbyblockhashandindex" id="eth_gettransactionbyblockhashandindex"></a>



Returns information about a transaction by block hash and transaction index position.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-19)

1. `Data` - 32 bytes - hash of a block
2. `Quantity` - integer of the transaction index position

```json
params: [
   '0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331',
   '0x0' // 0
]
```

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-19)

See [eth\_getTransactionByHash](evm-api-reference.md#eth\_gettransactionbyhash)

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-19)

Request

{% code overflow="wrap" %}
```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"eth_getTransactionByBlockHashAndIndex","params":["0xc6ef2fc5426d6ad6fd9e2a26abeab0aa2411b7ab17f30a99d3cb96aed1d1055b", "0x0"],"id":1}'
```
{% endcode %}

Response See [eth\_getTransactionByHash](evm-api-reference.md#eth\_gettransactionbyhash)

[back to top](evm-api-reference.md)

#### eth\_getTransactionByBlockNumberAndIndex[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_gettransactionbyblocknumberandindex) <a href="#eth_gettransactionbyblocknumberandindex" id="eth_gettransactionbyblocknumberandindex"></a>



Returns information about a transaction by block number and transaction index position.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-20)

1. `Quantity` or `Tag` - a block number, or the string "earliest", "latest" or "pending".
2. `Quantity` - integer of the transaction index position

{% code overflow="wrap" %}
```json
params: [
   '0x29c', // 668
   '0x0' // 0
]
```
{% endcode %}

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-20)

See [eth\_getTransactionByHash](evm-api-reference.md#eth\_gettransactionbyhash)

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-20)

Request

{% code overflow="wrap" %}
```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"eth_getTransactionByBlockNumberAndIndex","params":["0x29c", "0x0"],"id":1}'
```
{% endcode %}

Response See [eth\_getTransactionByHash](evm-api-reference.md#eth\_gettransactionbyhash)

[back to top](evm-api-reference.md)

#### eth\_getTransactionReceipt[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_gettransactionreceipt) <a href="#eth_gettransactionreceipt" id="eth_gettransactionreceipt"></a>



Returns the receipt of a transaction by transaction hash.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-21)

1. `Hash` - hash of a transaction.

```
params: ["0x444172bef57ad978655171a8af2cfd89baa02a97fcb773067aef7794d6913374"]
```

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-21)

1. `Object` - A transaction receipt object, or `null` when no receipt was found:
   * `blockHash`: `Hash` - 32 Bytes - hash of the block where this transaction was in.
   * `blockNumber`: `Quantity` or Tag - block number where this transaction was in.
   * `contractAddress`: `Address` - 20 Bytes - The contract address created, if the transaction was a contract creation, otherwise null.
   * `cumulativeGasUsed`: `Quantity` - The total amount of gas used when this transaction was executed in the block.
   * `from`: `Address` - 20 Bytes - The address of the sender.
   * `to`: `Address` - 20 Bytes - The address of the receiver. null when it’s a contract creation transaction.
   * `gasUsed`: `Quantity` - The amount of gas used by this specific transaction alone.
   * `logs`: `Array` - Array of log objects, which this transaction generated.
   * `logsBloom`: `Hash` - 256 Bytes - A bloom filter of logs/events generated by contracts during transaction execution. Used to efficiently rule out transactions without expected logs.
   * `root`: `Hash` - 32 Bytes - Merkle root of the state trie after the transaction has been executed (optional after Byzantium hard fork EIP609)
   * `status`: `Quantity` - 0x0 indicates transaction failure , 0x1 indicates transaction success. Set for blocks mined after Byzantium hard fork EIP609, null before.
   * `transactionHash`: `Hash` - 32 Bytes - hash of the transaction.
   * `transactionIndex`: `Quantity` - Integer of the transactions index position in the block.

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-21)

Request

{% code overflow="wrap" %}
```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_getTransactionReceipt","params":["0x444172bef57ad978655171a8af2cfd89baa02a97fcb773067aef7794d6913374"],"id":1,"jsonrpc":"2.0"}'
```
{% endcode %}

Response

{% code overflow="wrap" %}
```json
{
  "id": 1,
  "jsonrpc": "2.0",
  "result": {
    "blockHash": "0x67c0303244ae4beeec329e0c66198e8db8938a94d15a366c7514626528abfc8c",
    "blockNumber": "0x6914b0",
    "contractAddress": "0x471a8bf3fd0dfbe20658a97155388cec674190bf", // or null, if none was created
    "from": "0xc931d93e97ab07fe42d923478ba2465f2",
    "to": null, // value is null because this example transaction is a contract creation
    "cumulativeGasUsed": "0x158e33",
    "gasUsed": "0xba2e6",
    "logs": [], // logs as returned by eth_getFilterLogs, etc.
    "logsBloom": "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    "root": null,
    "status": "0x1",
    "transactionHash": "0x444172bef57ad978655171a8af2cfd89baa02a97fcb773067aef7794d6913374",
    "transactionIndex": "0x4"
  }
}
```
{% endcode %}

[back to top](evm-api-reference.md)

#### eth\_getLogs[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#eth\_getlogs) <a href="#eth_getlogs" id="eth_getlogs"></a>



Returns an array of all logs matching a given filter object.

**Parameters**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#parameters-22)

1. `Object` - The filter options:
   * `fromBlock`: `QUANTITY`|`TAG` - (optional, default: "latest") Integer block number, or "latest" for the last mined block or "pending", "earliest" for not yet mined transactions.
   * `toBlock`: `QUANTITY`|`TAG` - (optional, default: "latest") Integer block number, or "latest" for the last mined block or "pending", "earliest" for not yet mined transactions.
   * `address`: `DATA`|`Array`, 20 Bytes - (optional) Contract address or a list of addresses from which logs should originate.
   * `topics`: `Array` of DATA, - (optional) Array of 32 Bytes DATA topics. Topics are order-dependent. Each topic can also be an array of DATA with “or” options.
   * `blockhash`: `DATA`, 32 Bytes - (optional, future) With the addition of EIP-234, blockHash will be a new filter option which restricts the logs returned to the single block with the 32-byte hash blockHash. Using blockHash is equivalent to fromBlock = toBlock = the block number with hash blockHash. If blockHash is present in in the filter criteria, then neither fromBlock nor toBlock are allowed.

{% code overflow="wrap" %}
```json
params: [{
  "topics": ["0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b"]
}]
```
{% endcode %}

**Returns**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#returns-22)

`Array` - Array of log objects, or an empty array if nothing has changed since last poll.

* For filters created with `eth_newBlockFilter` the return are block hashes (`DATA`, 32 Bytes), e.g. \["0x3454645634534..."].
* For filters created with `eth_newPendingTransactionFilter` the return are transaction hashes (`DATA`, 32 Bytes), e.g. \["0x6345343454645..."].
* For filters created with `eth_newFilter` logs are objects with following params:
  * `removed`: `TAG` - true when the log was removed, due to a chain reorganization. false if its a valid log.
  * `logIndex`: `QUANTITY` - integer of the log index position in the block. null when its pending log.
  * `transactionIndex`: `QUANTITY` - integer of the transactions index position log was created from. null when its pending log.
  * `transactionHash`: `DATA`, 32 Bytes - hash of the transactions this log was created from. null when its pending log.
  * `blockHash`: `DATA`, 32 Bytes - hash of the block where this log was in. null when its pending. null when its pending log.
  * `blockNumber`: `QUANTITY` - the block number where this log was in. null when its pending. null when its pending log.
  * `address`: `DATA`, 20 Bytes - address from which this log originated.
  * `data`: `DATA` - contains one or more 32 Bytes non-indexed arguments of the log.
  * `topics`: `Array` of `DATA` - Array of 0 to 4 32 Bytes DATA of indexed log arguments. (In solidity: The first topic is the hash of the signature of the event (e.g. Deposit(address,bytes32,uint256)), except you declared the event with the anonymous specifier.)

**Example**[**​**](https://wiki.findora.org/docs/developers/evm\_smart\_chain/web3#example-22)

Request

{% code overflow="wrap" %}
```bash
curl localhost:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"eth_getLogs","params":[{"topics":["0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b"]}],"id":1}'
```
{% endcode %}

Response

{% code overflow="wrap" %}
```json
{
  "id":1,
  "jsonrpc":"2.0",
  "result": [{
    "logIndex": "0x1", // 1
    "blockNumber":"0x1b4", // 436
    "blockHash": "0x8216c5785ac562ff41e2dcfdf5785ac562ff41e2dcfdf829c5a142f1fccd7d",
    "transactionHash":  "0xdf829c5a142f1fccd7d8216c5785ac562ff41e2dcfdf5785ac562ff41e2dcf",
    "transactionIndex": "0x0", // 0
    "address": "0x16c5785ac562ff41e2dcfdf829c5a142f1fccd7d",
    "data":"0x0000000000000000000000000000000000000000000000000000000000000000",
    "topics": ["0x59ebeb90bc63057b6515673c3ecf9438e5058bca0f92585014eced636878c9a5"]
    },{
      ...
    }]
}
```
{% endcode %}
