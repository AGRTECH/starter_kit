pragma solidity ^0.5.0;

import './Token.sol';
 
contract Transfer { 
  uint public feeAmount;
  Token public token;
  address public bank;

  constructor(Token _token) public {
    token = _token;
    bank = msg.sender;
  }
  
  function feeAmountChange(uint _feeAmount) public {
    feeAmount = _feeAmount;
  }

  function transferTest(uint _amount, address _sender, address _receiver) public {
    token.transfer(_receiver, _amount - feeAmount);
    token.transfer(bank, feeAmount);
  }
}