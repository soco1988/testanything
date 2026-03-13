// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract WalletAuthorization {
    mapping(address => bool) private authorized;

    event Authorized(address indexed wallet);
    event Revoked(address indexed wallet);

    modifier onlyAuthorized() {
        require(authorized[msg.sender], "You are not authorized.");
        _;
    }

    // Authorize a wallet to perform actions
    function authorize(address _wallet) public onlyAuthorized {
        authorized[_wallet] = true;
        emit Authorized(_wallet);
    }

    // Revoke authorization for a wallet
    function revoke(address _wallet) public onlyAuthorized {
        authorized[_wallet] = false;
        emit Revoked(_wallet);
    }

    // Check if a wallet is authorized
    function isAuthorized(address _wallet) public view returns (bool) {
        return authorized[_wallet];
    }
}