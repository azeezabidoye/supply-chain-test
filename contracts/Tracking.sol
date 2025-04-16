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
        uint256 pickUpTime;
        uint256 deliveryTime;
        uint256 distance;
        uint256 price;
        ShipmentStatus status;
        bool isPaid;
    }

        function createShipment(address _reciever, uint256 _pickUpTime, uint256 _distance, uint256 _price) public payable {
            require(msg.value == _price, "Payment amount must equal the price");

             Shipment memory shipment = Shipment(msg.sender, _reciever, _pickUpTime, 0, _distance, _price, ShipmentStatus.PENDING, false);

             shipments[msg.sender].push(shipment);

        }
}