pragma solidity 0.5.11;

import "../utils/PermissionGroupsNoModifiers.sol";


contract MockPermissionGroupsNoModifiers is PermissionGroupsNoModifiers {
    uint256 public rate;
    bool public tradeActive = true;

    constructor() public PermissionGroupsNoModifiers(msg.sender) {}

    function setRate(uint256 newRate) public {
        onlyOperator();
        rate = newRate;
    }

    function stopTrade() public {
        onlyAlerter();
        tradeActive = false;
    }

    function activateTrade() public {
        onlyOperator();
        tradeActive = true;
    }
}