-include .env

attack_fallback:; @forge script script/01_Fallback.s.sol:FallbackAttacker --rpc-url $(SEPOLIA_RPC_URL) --broadcast
attack_fallout:; @forge script script/02_Fallout.s.sol:FalloutAttacker --rpc-url $(SEPOLIA_RPC_URL) --broadcast
coinflip_attack:; @forge script script/03_CoinFlip.s.sol:CoinFlipAttacker --rpc-url $(SEPOLIA_RPC_URL) --broadcast
telephone_attack:; @forge script script/04_Telephone.s.sol:TelephoneAttacker --rpc-url $(SEPOLIA_RPC_URL) --broadcast
token_attack:; @forge script script/05_Token.s.sol:TokenAttacker --rpc-url $(SEPOLIA_RPC_URL) --sender $(EOA_ADDRESS) --broadcast
delegation_attack:; @forge script script/06_Delegation.s.sol:DelegationAttacker --rpc-url $SEPOLIA_RPC_URL --sender $(EOA_ADDRESS) --broadcast
force_attack:; @forge script script/07_Force.s.sol:ForceAttacker --rpc-url $(SEPOLIA_RPC_URL) --broadcast
vault_attack:; @forge script script/08_Vault.s.sol:VaultAttacker --rpc-url $(SEPOLIA_RPC_URL) --broadcast