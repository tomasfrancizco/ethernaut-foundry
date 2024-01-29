
# Ethernaut - Foundry | by @tomasfrancizco

In this repo you will find all the solutions for the OpenZeppelin's **Ethernaut** challenges using Foundry.

There is a brief explanation of what's going on in the Attacker contracts.

## How is this repo structured?

All examples are for challenge # 4, but the same applies to all of them.

For each Ethernaut's challenge you will find 4 files

1. The challenge:

`./src/04_CoinFlip/04_CoinFlip.sol`

2. The attacker contract:

`.src/04_CoinFlip/04_CoinFlipAttacker.sol`

3. The deploy script

`script/04_Deploy.s.sol`

4. The Attack script

`script/04_Attack.s.sol`

Some challenges don't require an attacker contract and can be completed directly through the terminal via external calls. In those cases the `00_Attack.s.sol` has the instructions to do so.


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

3. Deploy Ethernaut's instance and change address on `src/04_CoinFlip/04_CoinFlipAttacker.sol`

```
address constant COINFLIP_INSTANCE =
```

4. Run deploy command to deploy attacker contract

```
forge script script/04_Deploy.s.sol:DeployCoinFlipAttacker --private-key $PRIVATE_KEY --rpc-url $SEPOLIA_RPC_URL --broadcast
```

5. Change Attacker's address on `script/04_Attack.s.sol`
```
address constant COINFLIP_ATTACKER_INSTANCE =
```

6. Run attack command
```
forge script script/04_Attack.s.sol:Attack --private-key $PRIVATE_KEY --rpc-url $SEPOLIA_RPC_URL --broadcast
```

7. Submit instance through Ethernaut's website.