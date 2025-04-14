// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { console } from "forge-std/console.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

contract LockContract is Ownable { 

    // constructor() ERC20("Sweety", "STY"){
    //     console.log("hi this is test coin");
    // }

    // function mint(address _to, uint _amount) public{
    //     _mint(_to, _amount);
    // }

    address public tokenAddress;
    uint256 public balance;

    mapping(address=>uint256) public pendingBalance;


    constructor(address _tokenAddress) Ownable(msg.sender){
        tokenAddress = _tokenAddress;
    }

    function deposit(uint256 _amount) public{
        require(IERC20(tokenAddress).allowance(msg.sender, address(this)) >= _amount);
        IERC20(tokenAddress).transferFrom(msg.sender, address(this), _amount);
        pendingBalance[msg.sender] += _amount;
    }

    function withdraw(uint256 _amount) public{
        require(pendingBalance[msg.sender] >= _amount);
        pendingBalance[msg.sender] -= _amount;        
        IERC20(tokenAddress).transfer(msg.sender, _amount);
    }

}
