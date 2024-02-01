
# Ethernaut - Foundry | by @tomasfrancizco

In this repo you will find all the solutions for the OpenZeppelin's **Ethernaut** challenges using Foundry.

There is a brief explanation of what's going on in the scripts.

## How is this repo structured?

For each Ethernaut's challenge you will find 2 files

1. The challenge:

`src/00_Challenge.sol`

2. The attacker contract/script:

`script/00_Challenge.s.sol`


## Install and Run

To install Foundry, you can check [this link](https://book.getfoundry.sh/getting-started/installation)

1. Clone this repository
```
git clone https://github.com/tomasfrancizco/ethernaut-foundry.git
cd ethernaut-foundry
forge build
```

2. Create `.env` file whit these variables

```
SEPOLIA_RPC_URL=
PRIVATE_KEY=
```

1. Deploy Ethernaut's instance from the [site](https://ethernaut.openzeppelin.com/) and change the instance's address on the corresponding script file.

```
address payable challengeInstanceAddress = payable(0x0000000000000000000000000000000000000000);
```

2. Run script
   e.g.: first challenge

```
forge script script/02_Fallback.s.sol:FallbackAttacker --rpc-url $SEPOLIA_RPC_URL --broadcast
```

3. Submit instance through [Ethernaut's website](https://ethernaut.openzeppelin.com/)

## Solutions

