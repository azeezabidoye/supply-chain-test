// SPDX-License-Identifier: MIT 
pragma solidity ;

contract Tracking {
    uint256 public shipmentCount;
    enum ShipmentStatus {PENDING, IN_TRANSIT, DELIVERED}
    constructor() {
        shipmentCount = 0;
    }
}