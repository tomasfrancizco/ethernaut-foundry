// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";
import { GatekeeperTwo } from "../src/14_GatekeeperTwo.sol";

contract Attacker {

  GatekeeperTwo challenge;

  constructor(address challengeInstanceAddress) {
    challenge = GatekeeperTwo(challengeInstanceAddress);
  }

  function attack() public {
    
  }

}

contract GatekeeperTwoAttacker is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {

    HelperConfig helperConfig = new HelperConfig();
    address payable challengeInstanceAddress = payable(helperConfig.instances("GatekeeperTwo"));

    vm.startBroadcast(deployerPrivateKey);
    Attacker attacker = new Attacker(challengeInstanceAddress);
    attacker.attack();
    console.log("Entrant: %s", address(GatekeeperTwo(challengeInstanceAddress).entrant()));
    vm.stopBroadcast();
  }

}