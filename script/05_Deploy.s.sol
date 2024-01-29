// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Script } from "forge-std/Script.sol";
import { TelephoneAttacker } from "../src/05_Telephone/05_TelephoneAttacker.sol";

contract DeployTelephoneAttacker is Script {
    function run() external returns (TelephoneAttacker) {
        vm.startBroadcast();
        TelephoneAttacker telephoneAttacker = new TelephoneAttacker();
        vm.stopBroadcast();
        return (telephoneAttacker);
    }
}