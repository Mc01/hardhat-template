// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

/**************************************

    security-contact:
    - email: defi@10clouds.com

**************************************/

// OpenZeppelin
import { AccessControl } from "@openzeppelin/contracts/access/AccessControl.sol";
import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**************************************
    
    Test ERC20 contract

**************************************/

contract TestToken is ERC20, AccessControl {

    // access control
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    // errors
    error SenderNotMinter(address sender);

    /**************************************
    
        Constructor

     **************************************/

    constructor() 
    ERC20("10C Token", "10C") {

        // tx.members
        address sender_ = msg.sender;

        // admin setup
        _setupRole(DEFAULT_ADMIN_ROLE, sender_);
        _setRoleAdmin(MINTER_ROLE, DEFAULT_ADMIN_ROLE);

        // role setup
        _setupRole(MINTER_ROLE, sender_);

    }

    /**************************************
    
        Mint by owner

     **************************************/

    function mint(address _to, uint256 _amount) 
    onlyRole(MINTER_ROLE) external {

        // mint
        _mint(_to, _amount);

    }

}
