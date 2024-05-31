// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Preservation {
    // public library contracts
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;
    uint256 storedTime;
    // Sets the function signature for delegatecall
    bytes4 constant setTimeSignature = bytes4(keccak256("setTime(uint256)"));

    constructor(address _timeZone1LibraryAddress, address _timeZone2LibraryAddress) {
        timeZone1Library = _timeZone1LibraryAddress;
        timeZone2Library = _timeZone2LibraryAddress;
        owner = msg.sender;
    }

    // set the time for timezone 1
    function setFirstTime(uint256 _timeStamp) public {
        timeZone1Library.delegatecall(abi.encodePacked(setTimeSignature, _timeStamp));
    }

    // set the time for timezone 2
    function setSecondTime(uint256 _timeStamp) public {
        timeZone2Library.delegatecall(abi.encodePacked(setTimeSignature, _timeStamp));
    }
}

// Simple library contract to set the time
contract LibraryContract {
    // stores a timestamp
    uint256 storedTime;

    function setTime(uint256 _time) public {
        storedTime = _time;
    }
}

// https://sepolia.etherscan.io/address/0xf88ed7d1dfcd1bb89a975662fd7cb536058f3a30#code
// 0x6080604052348015600f57600080fd5b506004361060285760003560e01c80633beb26c414602d575b600080fd5b603d6038366004603f565b600055565b005b600060208284031215605057600080fd5b503591905056fea2646970667358221220
// 4b8e7962a739de7c9721cd390399968e16ce84a8789867a006943ff4b14c55d864736f6c634300080c0033

// https://sepolia.etherscan.io/address/0x7f08c632697adf1b5052d2eb82d3a272b0b92312#code
// 0x6080604052348015600f57600080fd5b506004361060285760003560e01c80633beb26c414602d575b600080fd5b603d6038366004603f565b600055565b005b600060208284031215605057600080fd5b503591905056fea2646970667358221220
// 4b8e7962a739de7c9721cd390399968e16ce84a8789867a006943ff4b14c55d864736f6c634300080c0033 

// out
// 0x6080604052348015600f57600080fd5b506004361060285760003560e01c80633beb26c414602d575b600080fd5b603d6038366004603f565b600055565b005b600060208284031215605057600080fd5b503591905056fea2646970667358221220
// cb08051457a685eddc1572d306d9fb311b50e23a70ef42b3f53d982b8702232b64736f6c63430008150033