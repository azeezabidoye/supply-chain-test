// SPDX-License-Identifier: MIT 
pragma solidity ;

contract Tracking {
    enum ShipmentStatus {}
    constructor() {
        owner = msg.sender;
    }
}