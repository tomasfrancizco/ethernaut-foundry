// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { Force } from "../src/07_Force.sol";

contract ForceAttacker is Script {

  address challengeInstanceAddress = 0x345Dbbe34265645e8000370B1b0934eC158c2D4E;
  Force challenge = Force(challengeInstanceAddress);
  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {
    vm.startBroadcast(deployerPrivateKey);
    
    vm.stopBroadcast();
  }

}