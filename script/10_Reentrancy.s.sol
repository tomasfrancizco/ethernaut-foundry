// SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;

import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";
import { Reentrance } from "../src/10_Reentrancy.sol";

contract ReentrancyAttacker is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {

    HelperConfig helperConfig = new HelperConfig();
    address payable challengeInstanceAddress = payable(herlperConfig.instances("Reentrancy"));
    Reentrance challenge = Reentrance(challengeInstanceAddress);

    vm.startBroadcast(deployerPrivateKey);

    vm.stopBroadcast();
  }

}