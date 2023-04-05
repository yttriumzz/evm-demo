// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "hardhat/console.sol";

// https://eips.ethereum.org/EIPS/eip-150
contract EIP150_all_but_one_64th {
    function test(uint256 flag) external {
        console.log("[*] start gas: %d", gasleft());
        if (flag == 0) {
            this.external_func();
        } else if (flag == 1) {
            public_func();
        } else {
            private_func();
        }
        console.log("[*] end gas: %d", gasleft());
    }

    function external_func() external {
        console.log("[*] func gas: %d", gasleft());
    }

    function public_func() public {
        console.log("[*] func gas: %d", gasleft());
    }

    function private_func() private {
        console.log("[*] func gas: %d", gasleft());
    }
}
