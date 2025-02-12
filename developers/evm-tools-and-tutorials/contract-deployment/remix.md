# Remix

#### Overview[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/evm-guides/deployment-guides/remix#overview) <a href="#overview" id="overview"></a>

Developers can also use Remix IDE to interact with Findora. Remix IDE is one of the most commonly used development environments for Ethereum smart contracts. It can provide network-based solutions to quickly compile and deploy Solidity and Vyper code on local VMs or external Web3 providers (such as MetaMask). By combining the two tools, developers can quickly start deployment on Findora.

#### How to start using Remix[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/evm-guides/deployment-guides/remix#how-to-start-using-remix) <a href="#how-to-start-using-remix" id="how-to-start-using-remix"></a>

Now, we can start Remix to use more advanced features of Findora.

* First, we open a new tab and enter [https://remix.ethereum.org/](https://remix.ethereum.org/) to open Remix.
* In the main screen, click Environments, select Solidity to configure Remix for Solidity development, and finally open the File Explorers screen. We need to create a new folder to store the Solidity smart contract.
* Click the "+" button under File Explorers, then enter "MyContract.sol in the pop-up window, and paste the following smart contract to the pop-up editing window

```solidity
pragma solidity ^0.7.5;

contract MyContract {
    //Your logic code
}
```

#### Deploy contract[​](https://wiki.findora.org/docs/developers/evm\_smart\_chain/evm-guides/deployment-guides/remix#deploy-contract) <a href="#deploy-contract" id="deploy-contract"></a>

We will show how to use Remix to deploy smart contracts on Findora through the following basic contracts:

1. After the compilation is complete, we can go to the "Deploy & Run Transactions" tab. First, you need to set the environment to "Injected Web3".
2. You need to use the provider imported by MetaMask, and deploy the contract to the network connected to it through the provider. In this example, it is the Findora Devnet test network.
3. We will use a MetaMask account with an asset balance to deploy the contract. It can be funded through our testnet faucet ([refer to this guide](../../../general-user-materials/request-fra-testnet.md)) and then deployed on Findora Devnet.
4. Next, enter Test Contract in the constructor and click "Deploy".
5. MetaMask pop-up window will display transaction-related information, we need to click "confirm" to sign.

<figure><img src="../../../.gitbook/assets/image (10) (1).png" alt=""><figcaption></figcaption></figure>

6\. After the transaction is confirmed, the contract will appear in the "Deployed Contracts" column of Remix. From here, you can interact with the contract function.

<figure><img src="../../../.gitbook/assets/image (3) (2) (1).png" alt=""><figcaption></figcaption></figure>
