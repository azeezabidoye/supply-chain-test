// SPDX-License-Identifier: MIT 
pragma solidity ;

contract Tracking {
    uint256 public shipmentCount;
    enum ShipmentStatus {PENDING, IN_TRANSIT, DELIVERED}
    constructor() {
        shipmentCount = 0;
    }

    struct Shipment {
        address sender;
        address reciever;
        uint256 pickUpTime;
        uint256 deliveryTime;
        uint256 distance;
        uint256 price;
        ShipmentStatus status;
        bool isPaid;
    }

    mapping (address => Shipment[]) public shipments;

    struct TypeShipment {
        address sender;
        address reciever;
    }
}