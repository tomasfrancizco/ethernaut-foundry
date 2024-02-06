// SPDX-License-Identifier: MIT

pragma solidity >=0.6.2 <=0.8.23;

import { Script } from "forge-std/Script.sol";

contract HelperConfig is Script {
  
  mapping (string => address) public instances;
  
  constructor () public {
    instances["Fallback"] = 0xa0fEd194dc31c971d488F09507Eb1dD4C469d658;
    instances["Fallout"] = 0xECA0881C4976ceCdc0E9E6c147BD1CC6D5f42E73;
    instances["CoinFlip"] = 0x260dD640ce54288a0Fbe7A8913c262C46E143973;
    instances["Telephone"] = 0x5B70DeF289E41b7FEabB8bEB5C9fEda5b4ee4194;
    instances["Token"] = 0x2E8E571046A2e67Bd9ce29a227ba6328195998A1;
    instances["Delegation"] = 0x30BF7DD2633A0c81C4EE0ab717bE3114cDd818B1;
    instances["Force"] = 0x345Dbbe34265645e8000370B1b0934eC158c2D4E;
    instances["Vault"] = 0x67f1b172b26c38Ee6684E18b1b81Ce45e317A120;
    instances["King"] = 0x913bE527a67E3a0945ec13A7c00f3480C48965d2;
    instances["Reentrancy"] = 0x48AA3a734156C374F9F07AF48359CF3C4624d83E;
  }
}