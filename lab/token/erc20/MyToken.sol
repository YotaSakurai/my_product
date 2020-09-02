pragma solidity ^0.7.0;
//import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
//import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
//import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";
//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract MyToken is ERC20 {
    string public name = "MyToken";
    string public symbol = "TST";
    uint public decimals = 18;

    function MyToken(uint initialSupply) public{
        totalSupply_ = initialSupply;
        //balances[msg.sender] = initialSupply;
        _mint(msg.sender, initialSupply);
    }
}