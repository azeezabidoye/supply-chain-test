// SPDX-License-Identifier: MIT 
pragma solidity ;

contract Tracking {
    address owner;
    constructor() {
        owner = msg.sender;
    }
}