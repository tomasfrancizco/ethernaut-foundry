// SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;

import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";
import { GatekeeperOne } from "../src/13_GatekeeperOne.sol";

contract GatekeeperOneAttacker is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {

    HelperConfig helperConfig = new HelperConfig();
    address payable challengeInstanceAddress = payable(helperConfig.instances("GatekeeperOne"));
    GatekeeperOne challenge = GatekeeperOne(challengeInstanceAddress);

    vm.startBroadcast(deployerPrivateKey);

    vm.stopBroadcast();
  }

}