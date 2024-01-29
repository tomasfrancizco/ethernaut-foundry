// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import { CoinFlipAttacker } from "../src/04_Coinflip/04_CoinFlipAttacker.sol";

contract DeployCoinFlipAttacker is Script {
    function run() external returns (CoinFlipAttacker) {
        vm.startBroadcast();
        CoinFlipAttacker coinFlipAttacker = new CoinFlipAttacker();
        vm.stopBroadcast();
        return (coinFlipAttacker);
    }
}
