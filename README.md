# Building on Avalanche - Module 4

This Solidity program is a simple smart contract program that demonstrates the transaction of ERC20 tokens in Avalanche network for Degen Gaming.

## Description

This program is a smart contract written in Solidity, which will have the function to mint, burn, transfer, redeem DGN Tokens to and from the addresses of the ERC20 tokens in Avalanche Fuji Network.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., DGNToken.sol). Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DGNToken is ERC20, Ownable {
    uint256[] internal clanIds;
    mapping(uint256 => Clan) public clans;

    struct Clan {
        string clanName;
        uint256 amount;
    }

    constructor(uint256 initialSupply) ERC20("DEGEN", "DGN") Ownable(msg.sender) {
        _mint(msg.sender, initialSupply);

        clans[1] = Clan("Tier 1", 50);
        clans[2] = Clan("Tier 2", 100);
        clans[3] = Clan("Tier 3", 150);

        clanIds.push(1);
        clanIds.push(2);
        clanIds.push(3);
    }

    function mintDGNToken(address _to, uint256 _value) external onlyOwner {
        _mint(_to, _value);
    }

        function burnDGNToken(uint256 _value) external {
        _burn(msg.sender, _value);
    }

    function transferDGNToken(address _recipient, uint256 _amount) external returns (bool) {
        require(balanceOf(msg.sender) >= _amount, "Insufficient balance");
        _transfer(msg.sender, _recipient, _amount);
        return true;
    }

    function checkDGNTokenBal() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function redeemClan(uint256 _clanId) external {
        require(clans[_clanId].amount > 0, "Clan does not exist");
        require(balanceOf(msg.sender) >= clans[_clanId].amount, "Insufficient balance");

        _transfer(msg.sender, address(this), clans[_clanId].amount);

        delete clans[_clanId];
    }

    function showAllTiers() external view returns (Clan[] memory) {
        Clan[] memory allClans = new Clan[](clanIds.length);
        for (uint256 i = 0; i < clanIds.length; i++) {
            allClans[i] = clans[clanIds[i]];
        }
        return allClans;
    }
}
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.20" (or another compatible version), and then click on the "Compile DGNToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "DGNToken" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the functions. Finally, click on the "transact" button to execute the function and interact with the contract.

## Authors

franznvs  
[@franznvs](discordapp.com/users/705756624408805376)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
