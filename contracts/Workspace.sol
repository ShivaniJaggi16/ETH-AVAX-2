// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Workspace {
    address public owner;
    uint256 public balance;

    event Deposit(address indexed depositor, uint256 amount);
    event Withdraw(address indexed withdrawer, uint256 amount);

    constructor(uint256 initBalance) payable {
        owner = msg.sender;
        balance = initBalance;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }

    function deposit(uint256 _amount) public payable onlyOwner {
        require(_amount > 0, "Deposit amount must be greater than zero");

        uint256 previousBalance = balance;
        balance += _amount;
        require(balance == previousBalance + _amount, "Deposit failed");

        emit Deposit(msg.sender, _amount);
    }

    function withdraw(uint256 _withdrawAmount) public onlyOwner {
        require(_withdrawAmount > 0, "Withdrawal amount must be greater than zero");
        require(balance >= _withdrawAmount, "Insufficient balance");

        uint256 previousBalance = balance;
        balance -= _withdrawAmount;
        require(balance == previousBalance - _withdrawAmount, "Withdrawal failed");

        emit Withdraw(msg.sender, _withdrawAmount);
    }
}

