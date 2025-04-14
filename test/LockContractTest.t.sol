// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/USDT.sol";
import "src/LockContract.sol";

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract LockContractTest is Test {
    LockContract c;
    USDT usdt;

    function setUp() public {
        usdt = new USDT();
        c = new LockContract(address(usdt));
    }

    function testBar() public {
        assertEq(uint256(1), uint256(1), "ok");
    }

    function testFoo(uint256 x) public {
        vm.assume(x < type(uint128).max);
        assertEq(x + x, x * 2);
    }

    // function testBal() public{
    //         c.mint(address(this),50);
    //         assertEq(c.balanceOf(address(this)),50, "okkk");
    //     }

    function testDepo() public{
        usdt.mint(0xDf9CC552C236c43a594B8350E55Ffc50b2b8C515,500);
        vm.startPrank(0xDf9CC552C236c43a594B8350E55Ffc50b2b8C515);

        usdt.approve(address(c),200);
        c.deposit(200);

         assertEq(usdt.balanceOf(0xDf9CC552C236c43a594B8350E55Ffc50b2b8C515), 300);
         assertEq(usdt.balanceOf(address(c)),200, "okk");
         assertEq(c.pendingBalance(0xDf9CC552C236c43a594B8350E55Ffc50b2b8C515),200);


         c.withdraw(100);

         assertEq(usdt.balanceOf(0xDf9CC552C236c43a594B8350E55Ffc50b2b8C515), 400);
         assertEq(usdt.balanceOf(address(c)),100, "okk");
         assertEq(c.pendingBalance(0xDf9CC552C236c43a594B8350E55Ffc50b2b8C515),100);


    }
   
}
