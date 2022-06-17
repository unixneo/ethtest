// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;
 
//Safe Math Interface
 
contract SafeMath {
 
    function safeAdd(uint a, uint b) external pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
 
    function safeSub(uint a, uint b) external pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
 
    function safeMul(uint a, uint b) external pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
 
    function safeDiv(uint a, uint b) external pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
}
 
 
//ERC Token Standard #20 Interface
 
contract ERC20Interface {
    function totalSupply() external view
    
    
     returns (uint);
    function balanceOf(address tokenOwner) external view
    
    
     returns (uint balance);
    function allowance(address tokenOwner, address spender) external view
    
    
     returns (uint remaining);
    function transfer(address to, uint tokens) external returns (bool success);
    function approve(address spender, uint tokens) external returns (bool success);
    function transferFrom(address from, address to, uint tokens) external returns (bool success);
 
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}
 
 
//Contract function to receive approval and execute function in one call
 
contract ApproveAndCallFallBack {
    function receiveApproval(address from, uint256 tokens, address token, bytes memory data) external;
}
 
//Actual token contract
 
contract QKCToken is ERC20Interface, SafeMath {
    string public symbol;
    string public  name;
    uint8 public decimals;
    uint public _totalSupply;
 
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;
 
    constructor() external {
        symbol = "QKC";
        name = "QuikNode Coin";
        decimals = 2;
        _totalSupply = 100000;
        balances[0xE179C056024150d56A4e94af9C5A36BCC0B4e502] = _totalSupply;
        emit Transfer(address(0), 0xE179C056024150d56A4e94af9C5A36BCC0B4e502, _totalSupply);
    }
 
    function totalSupply() external view
    
    
     returns (uint) {
        return _totalSupply  - balances[address(0)];
    }
 
    function balanceOf(address tokenOwner) external view
    
    
     returns (uint balance) {
        return balances[tokenOwner];
    }
 
    function transfer(address to, uint tokens) external returns (bool success) {
        balances[msg.sender] = safeSub(balances[msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
 
    function approve(address spender, uint tokens) external returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
 
    function transferFrom(address from, address to, uint tokens) external returns (bool success) {
        balances[from] = safeSub(balances[from], tokens);
        allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(from, to, tokens);
        return true;
    }
 
    function allowance(address tokenOwner, address spender) external view
    
    
     returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
 
    function approveAndCall(address spender, uint tokens, bytes memory data) external returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, this, data);
        return true;
    }
 
    fallback () external payable {
        revert();
    }
}