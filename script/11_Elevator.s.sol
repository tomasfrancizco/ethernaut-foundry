// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";
import { Elevator } from "../src/11_Elevator.sol";

contract ElevatorAttacker is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {

    HelperConfig helperConfig = new HelperConfig();
    address payable challengeInstanceAddress = payable(helperConfig.instances("Elevator"));
    Elevator challenge = Elevator(challengeInstanceAddress);    

    vm.startBroadcast(deployerPrivateKey);

    vm.stopBroadcast();
  }

}