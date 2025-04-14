// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/MyCoin.sol";

contract MyCoinTest is Test {
    MyCoin c;

    function setUp() public {
        c = new MyCoin();
    }

    function testBar() public {
        assertEq(uint256(1), uint256(1), "ok");
    }

    function testFoo(uint256 x) public {
        vm.assume(x < type(uint128).max);
        assertEq(x + x, x * 2);
    }

    function testBal() public{
            c.mint(address(this),50);
            assertEq(c.balanceOf(address(this)),50, "okkk");
        }

    
   
}
