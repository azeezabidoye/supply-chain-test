// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ;

contract Tracking {
    address owner;
    constructor() {
        owner = msg.sender;
    }
}