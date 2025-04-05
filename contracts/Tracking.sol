// SPDX-License-Identifier: MIT 
pragma solidity ;

contract Tracking {
    enum ShipmentStatus {PENDING, IN_TRANSIT}
    constructor() {
        owner = msg.sender;
    }
}