// SPDX-License-Identifier: MIT
pragma solidity 0.5.12;
// MNP ChaoticCoder

 import "./Safemath.sol";


contract Ownable{
    address public owner;

    modifier onlyOwner(){
        require(msg.sender == owner);
        _; //Continue execution
    }

    constructor() public{
        owner = msg.sender;
    }
}

contract ERC20 is Ownable  {
    using SafeMath for uint256;
    
    mapping (address => uint256) private _balances; // track balances of accounts

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (string memory name, string memory symbol) public {
        _name = name;
        _symbol = symbol;
        _decimals = 18;
    }


    function name() public view returns (string memory) {
       return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
    
    function balanceOf(address _account) public view returns (uint256) {
        return _balances[_account];
        
    }

    function mint(address _account, uint256 _amount) public onlyOwner {
        _balances[_account] = SafeMath.add(_balances[_account], _amount); 
        _totalSupply = SafeMath.add(_totalSupply,_amount);
        
        
    }

    function transfer(address _recipient, uint256 _amount) public returns (bool) {
        //check for required amount to transfer
        require(_balances[msg.sender] >= _amount, "Sorry, the sender does not have enough funds.");
        
        // remove from sender
        _balances[msg.sender] = SafeMath.sub(_balances[msg.sender], _amount);
        
        //add to _recipient
        _balances[_recipient] = SafeMath.add(_balances[_recipient], _amount);
        
        

    }
}
