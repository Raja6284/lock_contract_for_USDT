// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {console} from "forge-std/console.sol";

contract MyCoin is ERC20 { 

    constructor() ERC20("Sweety", "STY"){
        console.log("hi this is test coin");
    }

    function mint(address _to, uint _amount) public{
        _mint(_to, _amount);
    }

    

}
