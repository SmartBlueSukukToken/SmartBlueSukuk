// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

// ----------------------------------------------------------------------------
// Ownable contract
// ----------------------------------------------------------------------------
contract Ownable {
    address public owner;
    address public newOwner;

    // MODIFIERS

    /// Throws if called by any account other than the owner.
    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner");
        _;
    }

    /// Throws if called by any account other than the new owner.
    modifier onlyNewOwner() {
        require(msg.sender == newOwner, "Only New Owner");
        _;
    }

    modifier notNull(address _address) {
        require(_address != address(0),"address is Null");
        _;
    }

    // CONSTRUCTORS

    //
    // The Ownable constructor sets the original `owner` of the contract to the sender account.
    //
    
    constructor() {
        owner = msg.sender;
    }

    //Allows the current owner to transfer control of the contract to a newOwner.
    function transferOwnership(address _newOwner) public notNull(_newOwner) onlyOwner {
        newOwner = _newOwner;
    }

    /// Allows the new owner to claim ownership and so proving that the newOwner is valid.
    function acceptOwnership() public onlyNewOwner {
        address oldOwner = owner;
        owner = newOwner;
        newOwner = address(0);
        emit OwnershipTransferred(oldOwner, owner);
    }

    // EVENTS
    
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
}
