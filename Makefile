-include .env

attack_fallback:; forge script script/02_Fallback.s.sol:FallbackAttacker --rpc-url $(SEPOLIA_RPC_URL) --broadcast