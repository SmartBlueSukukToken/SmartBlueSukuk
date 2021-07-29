// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

///Provides information about the current execution context, including the sender of the transaction and its data.
abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
    return payable(msg.sender); // added payable
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode 
        return msg.data;
    }
}
