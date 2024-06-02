// SPDX-License-Identifier: MIT

pragma solidity >=0.6.2 <=0.8.23;

contract HelperConfig {
  
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
    instances["Elevator"] = 0xD852009b83006Fb4d1eFDf035e708FDA093D0339;
    instances["Privacy"] = 0x3e822f121bEF4fe5289f7AFc6F7Da34e753f4169;
    instances["GatekeeperOne"] = 0x4974a8d555694ed0Fbd52391DFf4F5e1f83Dc2E4;
    instances["GatekeeperTwo"] = 0xd9140Ce7Fadfa2a4B6d4347797e18e3bfcDfb0dA;
    instances["NaughtCoin"] = 0x58E561a86ef84b8452f9f2A18E627100A79c28B6;
    instances["Preservation"] = 0xA913abb2E29db8b8F96ccaE87CebbCd630481D6a;
    instances["Recovery"] = 0x5bA8d42026db7EE97A51ABc6A259222cF30b47Ad;
  }
}