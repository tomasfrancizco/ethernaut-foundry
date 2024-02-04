// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { King } from "../src/09_King.sol";

contract KingAttacker is Script {

  address payable challengeInstanceAddress = payable(0x913bE527a67E3a0945ec13A7c00f3480C48965d2);
  King challenge = King(challengeInstanceAddress);
  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {
    vm.startBroadcast(deployerPrivateKey);
    

    vm.stopBroadcast();
  }

}