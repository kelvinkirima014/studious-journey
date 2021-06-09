//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;


import "hardhat/console.sol";

contract Coin {
    address public minter;
    mapping (address => uint) public balances;

    event Sent (address from, address to, uint amount);

    constructor () {
        minter = msg.sender;
    }

    function mint (address receiver, uint amount) public {
        require (msg.sender ==  minter);
        require (amount < 1e60);
        balances[receiver] += amount;
    }

}