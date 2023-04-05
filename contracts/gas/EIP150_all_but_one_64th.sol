// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "hardhat/console.sol";

/*
 * https://eips.ethereum.org/EIPS/eip-150
 *
 * ```bash
 * yttriumzz@yttriumzz:~/evm-demo$ npx hardhat test --grep "EIP150_all_but_one_64th"
 * 
 * 
 *   EIP150_all_but_one_64th
 * ===== call external_func =====
 * [*] start gas: 28999771
 * [*] func gas: 28542737 <----- the gas here is 63/64 of the previous step
 * [*] end gas: 28994764
 * 
 * ====== call public_func ======
 * [*] start gas: 28999823
 * [*] func gas: 28996277
 * [*] end gas: 28995272
 * 
 * ====== call private_func =====
 * [*] start gas: 28999823
 * [*] func gas: 28996276
 * [*] end gas: 28995282
 * 
 *     ✔ EIP150_all_but_one_64th (1350ms)
 * 
 * 
 *   1 passing (1s)
 * ```
 */

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
