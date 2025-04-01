// SPDX-License-Identifier: SEE 
pragma solidity ;

contract Tracking {
    address owner;
    constructor() {
        owner = msg.sender;
    }
}