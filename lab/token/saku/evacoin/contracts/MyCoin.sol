pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Snapshot.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Pausable.sol";

// 10 billion
contract MyCoin is ERC20Capped(10000000000 ether) {
    string public name = "EvaluateCoin";
    string public symbol = "EVA";
    uint8 public decimals = 18;
    address public CFO;
    address public CEO;

    constructor() public {
        CEO = msg.sender;
        CFO = msg.sender;
    }

    function setCEO(address newCEO) external {
        require(msg.sender == CEO);

        CEO = newCEO;
    }

    function setCFO(address newCFO) external {
        require(msg.sender == CEO);
        CFO = newCFO;
    }

    /*    function () payable external {

    }
    */
    function withdrawEther() external {
        require(msg.sender == CFO || msg.sender == CEO);
        msg.sender.transfer(address(this).balance);
    }
    /*
    function removeMinter(address account) external {
        require(msg.sender == CFO || msg.sender == CEO);
        _removeMinter(account);
    }
*/
}
