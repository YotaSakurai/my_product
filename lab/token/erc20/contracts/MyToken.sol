pragma solidity ^0.6.2;
import "node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20{
    string public name = "MyToken";
    string public symbol = "MTKN";
    uint public decimals = 18;

    function MyToken(uint initialSupply) public{
        //_totalSupply = initialSupply;
        //balanceOf[msg.sender] = initialSupply;
        _mint(msg.sender, initialSupply);
    }
}