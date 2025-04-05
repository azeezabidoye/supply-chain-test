// SPDX-License-Identifier: MIT 
pragma solidity ;

contract Tracking {
    enum ShipmentStatus {PENDING, IN_TRANSIT, DELIVERED}
    constructor() {
        owner = msg.sender;
    }
}