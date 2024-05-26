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
