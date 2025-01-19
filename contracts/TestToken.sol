// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TestToken is ERC20 {
    constructor() ERC20("TestToken", "TT") {
        _mint(msg.sender, 1000000 * 10 ** decimals()); // 初始铸造 100 万个代币
    }

    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }
}
