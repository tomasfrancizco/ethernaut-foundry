// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {Preservation} from "../src/16_Preservation.sol";

contract PreservationAttacker is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
  address player = vm.envAddress("USER");

  function run() external {
    
    HelperConfig helperConfig = new HelperConfig();
    address challengeInstanceAddress = helperConfig.instances("NaughtCoin");
    Preservation challenge = Preservation(challengeInstanceAddress);
    vm.startBroadcast(deployerPrivateKey);
    vm.stopBroadcast();
  }
}