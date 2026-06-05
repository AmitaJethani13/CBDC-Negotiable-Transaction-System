// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CBDCNegotiableTransaction {

    // =====================================================
    // STRUCTS
    // =====================================================

    struct User {
        string pubSID;
        bytes32 privIDHash;
        bool isRegistered;
    }

    struct TransactionDetails {
        address sender;
        address receiver;
        uint256 amount;
        uint256 timestamp;
        string terms;
    }

    struct ContractStatus {
        bool isInitialized;
        bool isValidated;
        bool isExecuted;
        bool isSettled;
    }

    // =====================================================
    // STATE VARIABLES
    // =====================================================

    mapping(address => User) public users;
    mapping(address => uint256) public cbdcBalances;

    TransactionDetails public transactionDetails;
    ContractStatus public contractStatus;

    address public owner;

    // =====================================================
    // EVENTS
    // =====================================================

    event UserRegistered(
        address indexed user,
        string pubSID
    );

    event ContractDeployed(
        address indexed sender,
        address indexed receiver,
        uint256 amount
    );

    event ContractValidated();

    event ConsensusAchieved();

    event CBDCTransferred(
        address indexed sender,
        address indexed receiver,
        uint256 amount
    );

    event BlockchainUpdated();

    event NotificationSent(
        address indexed user,
        string message
    );

    event AuditTrailCreated(
        string auditReference
    );

    // =====================================================
    // CONSTRUCTOR
    // =====================================================

    constructor() {
        owner = msg.sender;
    }

    // =====================================================
    // USER REGISTRATION
    // =====================================================

    function registerUser(
        string memory _pubSID,
        string memory _privateID
    ) public {

        require(
            !users[msg.sender].isRegistered,
            "User already registered"
        );

        users[msg.sender] = User({
            pubSID: _pubSID,
            privIDHash: keccak256(
                abi.encodePacked(_privateID)
            ),
            isRegistered: true
        });

        // Prototype CBDC allocation
        cbdcBalances[msg.sender] = 1000;

        emit UserRegistered(
            msg.sender,
            _pubSID
        );
    }

    // =====================================================
    // VIEW FUNCTIONS
    // =====================================================

    function getBalance(
        address userAddress
    )
        public
        view
        returns (uint256)
    {
        return cbdcBalances[userAddress];
    }

    function isUserRegistered(
        address userAddress
    )
        public
        view
        returns (bool)
    {
        return users[userAddress].isRegistered;
    }

    function verifyPrivateID(
        string memory enteredID
    )
        public
        view
        returns (bool)
    {
        return (
            users[msg.sender].privIDHash ==
            keccak256(
                abi.encodePacked(enteredID)
            )
        );
    }

    // =====================================================
    // DEPLOY SMART CONTRACT
    // =====================================================

    function deploySmartContract(
        address _receiver,
        uint256 _amount,
        string memory _terms
    )
        public
        returns (bool)
    {
        transactionDetails = TransactionDetails({
            sender: msg.sender,
            receiver: _receiver,
            amount: _amount,
            timestamp: block.timestamp,
            terms: _terms
        });

        contractStatus.isInitialized = true;

        emit ContractDeployed(
            msg.sender,
            _receiver,
            _amount
        );

        return true;
    }

    // =====================================================
    // VALIDATION
    // =====================================================

    function validateSmartContract()
        public
        returns (bool)
    {
        require(
            contractStatus.isInitialized,
            "Contract not initialized"
        );

        require(
            users[transactionDetails.sender].isRegistered,
            "Sender not registered"
        );

        require(
            users[transactionDetails.receiver].isRegistered,
            "Receiver not registered"
        );

        require(
            cbdcBalances[transactionDetails.sender] >=
            transactionDetails.amount,
            "Insufficient CBDC balance"
        );

        contractStatus.isValidated = true;

        emit ContractValidated();

        return true;
    }

    // =====================================================
    // CONSENSUS SIMULATION
    // =====================================================

    function executeConsensus()
        public
        returns (bool)
    {
        require(
            contractStatus.isValidated,
            "Contract not validated"
        );

        contractStatus.isExecuted = true;

        emit ConsensusAchieved();

        return true;
    }

    // =====================================================
    // CBDC TRANSFER
    // =====================================================

    function transferCBDC()
        public
        returns (bool)
    {
        require(
            contractStatus.isExecuted,
            "Consensus not achieved"
        );

        cbdcBalances[
            transactionDetails.sender
        ] -= transactionDetails.amount;

        cbdcBalances[
            transactionDetails.receiver
        ] += transactionDetails.amount;

        contractStatus.isSettled = true;

        emit CBDCTransferred(
            transactionDetails.sender,
            transactionDetails.receiver,
            transactionDetails.amount
        );

        return true;
    }

    // =====================================================
    // BLOCKCHAIN UPDATE
    // =====================================================

    function updateBlockchain()
        public
        returns (bool)
    {
        require(
            contractStatus.isSettled,
            "Transaction not settled"
        );

        emit BlockchainUpdated();

        return true;
    }

    // =====================================================
    // NOTIFICATION
    // =====================================================

    function sendNotification()
        public
    {
        require(
            contractStatus.isSettled,
            "Transaction incomplete"
        );

        emit NotificationSent(
            transactionDetails.sender,
            "Transaction Completed"
        );

        emit NotificationSent(
            transactionDetails.receiver,
            "Transaction Completed"
        );
    }

    // =====================================================
    // AUDIT TRAIL
    // =====================================================

    function createAuditTrail()
        public
    {
        require(
            contractStatus.isSettled,
            "Transaction incomplete"
        );

        emit AuditTrailCreated(
            "CBDC_AUDIT_COMPLETED"
        );
    }

    // =====================================================
    // EXECUTE COMPLETE WORKFLOW
    // =====================================================

    function executeSmartContract()
        public
        returns (bool)
    {
        validateSmartContract();
        executeConsensus();
        transferCBDC();
        updateBlockchain();
        sendNotification();
        createAuditTrail();

        return true;
    }

    // =====================================================
    // STATUS FUNCTION
    // =====================================================

    function getStatus()
        public
        view
        returns (
            bool initialized,
            bool validated,
            bool executed,
            bool settled
        )
    {
        return (
            contractStatus.isInitialized,
            contractStatus.isValidated,
            contractStatus.isExecuted,
            contractStatus.isSettled
        );
    }
}
