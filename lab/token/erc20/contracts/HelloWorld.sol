//SPDX-License-Identifier: MIT
pragma solidity >= 0.5.0 < 0.7.0;

contract HelloWorld {
  string defaultMessage;
  constructor() public {
    defaultMessage = 'Hello World';
  }
  function getMessage() public view returns(string memory){
    return defaultMessage;
  }
}