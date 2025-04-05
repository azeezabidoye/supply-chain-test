// SPDX-License-Identifier: MIT 
pragma solidity ;

contract Tracking {
    enum ShipmentStatus {PENDING}
    constructor() {
        owner = msg.sender;
    }
}