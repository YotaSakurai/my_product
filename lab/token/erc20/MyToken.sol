pragma solidity ^0.5.0;
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20{
    string public name = "MyToken";
    string public symbol = "TST";
    uint public decimals = 18;

    function MyToken(uint initialSupply) public{
        totalSupply_ = initialSupply;
        balances[msg.sender] = initialSupply;
    }
}