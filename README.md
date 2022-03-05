# Blockchain Team template for Hardhat

This is a GitHub template, which means you can reuse it as many times as you want. 
> You can do that by clicking the "Use this template" button at the top of the page.

Tech stack:
- [Hardhat](https://github.com/nomiclabs/hardhat): compile and run the smart contracts on a local development network
- [TypeChain](https://github.com/ethereum-ts/TypeChain): generate TypeScript types for smart contracts
- [Ethers](https://github.com/ethers-io/ethers.js/): renowned Ethereum library and wallet implementation
- [Waffle](https://github.com/EthWorks/Waffle): tooling for writing comprehensive smart contract tests
- [Solhint](https://github.com/protofire/solhint): linter
- [Prettier Plugin Solidity](https://github.com/prettier-solidity/prettier-plugin-solidity): code formatter
- [Remixd](remix/README.md): plugin that connects project files with Remix

## Requirements

Only requirements is:
- Docker (with docker-compose)

## Setup

Fill in secrets:
```sh
cp .env.template .env && nano .env
```

Start container:
```sh
make up
```

## Compilation

Compile contracts:
```sh
make compile
```

### Testing

Run tests with:
```sh
make runtest
```

### Deployment

Deploy to local node (Docker):
```
make deploy
```

Deploy to Rinkeby:
```
make deploy-rinkeby
```

### Etherscan verification

To verify contract code on Etherscan run:
```
docker-compose exec blockchain npx hardhat verify --network <network> <address> "args..."
```
> Example usage: docker-compose exec blockchain npx hardhat verify --network rinkeby 0xd94F3C21Ad78A403C964118646b849e768d69Dec
