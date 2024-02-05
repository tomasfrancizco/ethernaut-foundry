// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { Reentrancy } from "../src/10_Reentrancy.sol";

contract ReentrancyAttacker is Script {

  address payable challengeInstanceAddress = payable(0x48AA3a734156C374F9F07AF48359CF3C4624d83E);
  Reentrancy challenge = Reentrancy(challengeInstanceAddress);
  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {
    vm.startBroadcast(deployerPrivateKey);

    vm.stopBroadcast();
  }

}