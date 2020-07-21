//pragma solidity ^0.6.2;
pragma solidity >=0.5.0 <0.7.0;
import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/SafeERC20.sol";

contract MyToken is ERC20{
    string public constant CoinName = "first test coin";
    string public constant Symbol = "FTC";
    //初期値100億トークン
    uint256 constant _initial_supply = 10000000000;
    address private _MakerAddress;

    constructor() public ERC20(CoinName, Symbol) {
        _MakerAddress = msg.sender;
        _mint(msg.sender, _initial_supply);
    }

    function getMakerAddress() public view returns (address) {
        return _MakerAddress;
    }
}