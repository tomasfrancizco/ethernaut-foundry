// SPDX-License-Identifier: MIT

pragma solidity ^0.6.2;

import { Script, console } from "forge-std/Script.sol";
import { Delegation } from "../src/06_Delegation.sol";

contract DelegationAttacker is Script {

  address challengeInstanceAddress = 0x30BF7DD2633A0c81C4EE0ab717bE3114cDd818B1;
  Delegation challenge = Delegation(challengeInstanceAddress);
  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {
    vm.startBroadcast(deployerPrivateKey);
    
    vm.stopBroadcast();
  }

}