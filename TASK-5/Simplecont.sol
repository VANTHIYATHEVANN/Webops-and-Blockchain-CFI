// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleEscrow {
    address public partyA;
    address public partyB;
    uint256 public depositedAmount;
    bool public isFundsReleased;

    event FundsDeposited(address indexed depositor, uint256 amount);
    event FundsReleased(address indexed receiver, uint256 amount);

    constructor(address _partyB) {
        partyA = msg.sender;
        partyB = _partyB;
    }

    modifier onlyPartyB() {
        require(msg.sender == partyB, "Only Party B can call this function");
        _;
    }

    modifier fundsNotReleased() {
        require(!isFundsReleased, "Funds have already been released");
        _;
    }

    function depositFunds() external payable fundsNotReleased {
        require(msg.sender == partyA, "Only Party A can deposit funds");
        require(msg.value > 0, "Please deposit some ether");

        depositedAmount += msg.value;
        emit FundsDeposited(msg.sender, msg.value);
    }

    function releaseFunds() external onlyPartyB fundsNotReleased {
        // Implement the condition for releasing the funds here
        // For simplicity, we'll use a simple boolean flag
        isFundsReleased = true;
        payable(partyB).transfer(depositedAmount);
        emit FundsReleased(partyB, depositedAmount);
    }

    function getDepositedAmount() external view returns (uint256) {
        return depositedAmount;
    }
}
