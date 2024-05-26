# Building on Avalanche - Module 4

This Solidity program is a simple smart contract program that demonstrates the transaction of ERC20 tokens.

## Description

This program is a simple smart contract written in Solidity, which will have the function to mint, burn, and transfer tokens to and from the addresses of the ERC20 tokens.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., OwnERC20Token.sol). Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract Franz is ERC20("ZENIVOS", "ZNVS") {

    function mint(uint256 token) public {
        _mint(msg.sender, token);
    }

    function burn(uint256 token) public {
        _burn(msg.sender, token);
    }

    function transfer(address to, uint256 token) public override returns (bool) {
        _transfer(msg.sender, to, token);
        return true;
    }
}
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.20" (or another compatible version), and then click on the "Compile OwnERC20Token.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "OwnERC20Token" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the functions. Finally, click on the "transact" button to execute the function and interact with the contract.

## Authors

franznvs  
[@franznvs](discordapp.com/users/705756624408805376)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
