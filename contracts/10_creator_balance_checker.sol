/* 
	Another very basic contract. It demonstrates that a contract can retrieve and store the 
	balance of its creator address. Note that the creatorbalance value captured in the constructor is a snapshot in time.
	Later on, creator.balance will reflect whatever it is now.
*/
pragma solidity ^0.4.26;

contract creatorBalanceChecker {

    address creator;
    uint creatorbalance; 		// TIP: uint is an alias for uint256. Ditto int and int256.

    constructor() public 
    {
        creator = msg.sender; 								 // msg is a global variable
        creatorbalance = creator.balance;
    }

    function getContractAddress() public constant returns (address) 
    {
        return this;
    }
	
    function getCreatorBalance() public constant returns (uint)     // Will return the creator's balance AT THE TIME THIS CONTRACT WAS CREATED
    {
        return creatorbalance;
    }
    
    function getCreatorDotBalance() public constant returns (uint)  // Will return creator's balance NOW
    {
        return creator.balance;
    }
    
    /**********
     Standard kill() function to recover funds 
     **********/
    
    function kill() public
    { 
        if (msg.sender == creator)
            selfdestruct(creator);  // kills this contract and sends remaining funds back to creator
    }
        
}
