-include .env

attack_fallback:; forge script script/01_Fallback.s.sol:FallbackAttacker --rpc-url $(SEPOLIA_RPC_URL) --broadcast
attack_fallout:; forge script script/02_Fallout.s.sol:FalloutAttacker --rpc-url $(SEPOLIA_RPC_URL) --broadcast
coinflip_attack:; forge script script/03_CoinFlip.s.sol:CoinFlipAttacker --rpc-url $(SEPOLIA_RPC_URL) --broadcast