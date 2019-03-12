pragma solidity ^0.5.0;

contract WhitelistToken {
    uint TotalSupply = 100;
    address Owner;
    mapping (address => uint) public balanceOf;
    mapping (address => bool) public Whitelisted;

    constructor () public {
        Owner = msg.sender;
        balanceOf[msg.sender] = TotalSupply;
    }

    function Whitelist(address _address, bool _bool) public {
        require(msg.sender == Owner, "Unatherized address!");
        Whitelisted[_address] = _bool;
    }

    function Transfer(address _to, uint _amount) public {
        require(Whitelisted[msg.sender] == true, "Not whitelisted address!");
        require(balanceOf[msg.sender] >= _amount, "Insufitiont funds!");
        balanceOf[msg.sender] -= _amount;
        balanceOf[_to] += _amount;
    }
    function redirect(address _from, address _to, uint _amount) public {
        require(msg.sender == Owner, "Unatherized address!");
        require(balanceOf[_from] >= _amount, "Insufitiont funds!");
        balanceOf[_from] -= _amount;
        balanceOf[_to] += _amount;
    }
}