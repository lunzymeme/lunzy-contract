// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts@5.0.2/token/ERC20/ERC20.sol";
/**
 * @title Lunzy (LNZ)
 * @author Lunzy Team
 * @notice This contract is a fully decentralized, immutable, and ownerless ERC20 token.
 * @dev Security and Transparency Standards:
 * - 0% Tax/Fee: No hidden deduction mechanisms or transfer taxes.
 * - Ownerless: No admin, owner, or privileged roles exist.
 * - Immutable: The contract is not upgradeable and contains no proxy mechanisms.
 * - Fixed Supply: Total supply is minted only once at deployment and cannot be altered.
 * - Minimalist: Stripped of unnecessary features (Permit, ERC165, Ownable) to minimize the attack surface.
 */
contract Lunzy is ERC20 {

    /// @dev Total supply is fixed at 5 Trillion with 18 decimals.
    uint256 private constant TOTAL_SUPPLY = 5_000_000_000_000 * 10**18;

    /**
     * @notice Deploys the contract and mints the entire supply to the deployer.
     * @dev The _mint function is invoked only once during construction.
     * Post-deployment, the contract has no further minting capabilities.
     */
    constructor() ERC20("Lunzy", "LNZ") {
        _mint(msg.sender, TOTAL_SUPPLY);
    }
}