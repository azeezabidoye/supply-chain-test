// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract Tracking {
    enum ShipmentStatus {
        PENDING,
        IN_TRANSIT,
        DELIVERED
    }
    uint256 public shipmentCount;

    constructor() {
        shipmentCount = 10;
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

    mapping(address => Shipment[]) public shipments;

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

    TypeShipment[] typeShipments;

    event ShipmentCreated(
        address indexed sender,
        address indexed reciever,
        uint256 pickUpTime,
        uint256 distance,
        uint256 price
    );
    event ShipmentInTransit(
        address indexed sender,
        address indexed reciever,
        uint256 pickUpTime
    );
    event ShipmentDelivered(
        address indexed sender,
        address indexed reciever,
        uint256 deliveryTime
    );
    event ShipmentPaid(
        address indexed sender,
        address indexed reciever,
        uint256 amount
    );

    function createShipment(
        address _reciever,
        uint256 _pickUpTime,
        uint256 _distance,
        uint256 _price
    ) public payable {
        require(msg.value == _price, "Payment amount must equal the price");

        Shipment memory shipment = Shipment(
            msg.sender,
            _reciever,
            _pickUpTime,
            0,
            _distance,
            _price,
            ShipmentStatus.PENDING,
            false
        );

        shipments[msg.sender].push(shipment);
        shipmentCount++;

        typeShipments.push(
            TypeShipment(
                msg.sender,
                _reciever,
                _pickUpTime,
                0,
                _distance,
                _price,
                ShipmentStatus.PENDING,
                false
            )
        );

        emit ShipmentCreated(
            msg.sender,
            _reciever,
            _pickUpTime,
            _distance,
            _price
        );
    }

    function startShipment(
        address _sender,
        address _reciever,
        uint256 _index
    ) public {
        Shipment storage shipment = shipments[_sender][_index];
        TypeShipment storage typeShipment = typeShipments[_index];

        require(shipment.reciever == _reciever, "Invalid Reciever");
        require(
            shipment.status == ShipmentStatus.PENDING,
            "Shipment already in transit"
        );

        shipment.status = ShipmentStatus.IN_TRANSIT;

        typeShipment.status = ShipmentStatus.IN_TRANSIT;
        emit ShipmentInTransit(_sender, _reciever, shipment.pickUpTime);
    }

    function completeShipment(
        address _sender,
        address _reciever,
        uint256 _index
    ) public {
        Shipment storage shipment = shipments[_sender][_index];
        TypeShipment storage typeShipment = typeShipments[_index];

        require(shipment.reciever == _reciever, "Invalid Reciever");
        require(
            shipment.status == ShipmentStatus.IN_TRANSIT,
            "Shipment not in transit"
        );
        require(!shipment.isPaid, "Shipment already paid!");

        shipment.status = ShipmentStatus.DELIVERED;
        typeShipment.status = TypeShipment.DELIVERED;
        shipment.deliveryTime = block.timestamp;
        typeShipment.deliveryTime = block.timestamp;

        uint256 amount = shipment.price;

        payable(shipment.sender).transfer(amount);
        shipment.isPaid = true;
        typeShipment.isPaid = true;

        emit ShipmentDelivered(_sender, _reciever, shipment.deliveryTime);
        emit ShipmentPaid(_sender, _reciever, amount);
    }

    function getShipment(
        address _sender,
        uint256 _index
    )
        public
        view
        returns (
            address,
            address,
            uint256,
            uint256,
            uint256,
            ShipmentStatus,
            bool
        )
    {
        Shipment memory shipment = shipments[_sender][_index];

        return (
            shipment.sender,
            shipment.reciever,
            shipment.pickUpTime,
            shipment.deliveryTime,
            shipment.distance,
            shipment.price,
            shipment.status,
            shipment.isPaid
        );
    }

    function getShipmentCount(address _sender) public view returns (uint256) {
        return shipments[_sender].length;
    }

    function getAllTransactions() public view returns (TypeShipment[] memory) {
        return typeShipments;
    }
}
