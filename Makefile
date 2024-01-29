-include .env

deploy_04_CoinFlip:; forge script script/04_Deploy.s.sol:DeployCoinFlipAttacker --private-key $(PRIVATE_KEY) --rpc-url $(SEPOLIA_RPC_URL) --broadcast
attack_04_CoinFlip:; forge script script/04_Attack.s.sol:Attack --private-key $(PRIVATE_KEY) --rpc-url $(SEPOLIA_RPC_URL) --broadcast