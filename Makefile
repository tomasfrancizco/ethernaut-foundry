-include .env

attack_fallback:; forge script script/01_Fallback.s.sol:FallbackAttacker --rpc-url $(SEPOLIA_RPC_URL) --broadcast
attack_fallout:; forge script script/02_Fallout.s.sol:FalloutAttacker --rpc-url $(SEPOLIA_RPC_URL) --broadcast
coinflip_attack:; forge script script/03_CoinFlip.s.sol:CoinFlipAttacker --rpc-url $(SEPOLIA_RPC_URL) --broadcast
telephone_attack:; forge script script/04_Telephone.s.sol:TelephoneAttacker --rpc-url $(SEPOLIA_RPC_URL) --broadcast
token_attack:; forge script script/05_Token.s.sol:TokenAttacker --rpc-url $(SEPOLIA_RPC_URL) --sender 0x08f88ef7ecD64a2eA1f3887d725F78DDF1bacDF1 --broadcast