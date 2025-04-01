// SPDX-License-Identifier: SEE LICENSE IN 
pragma solidity ;

contract Tracking {
    address owner;
    constructor() {
        owner = msg.sender;
    }
}