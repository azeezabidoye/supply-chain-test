// SPDX-License-Identifier: SEE LICENSE 
pragma solidity ;

contract Tracking {
    address owner;
    constructor() {
        owner = msg.sender;
    }
}