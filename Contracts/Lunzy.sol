// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * ─────────────────────────────────────────────────────────────────────────────
 *  Lunzy (LNZ)
 *
 *  Design Philosophy:
 *  - Fixed supply ERC20 token
 *  - Zero tax, zero fee
 *  - No owner, no admin, no privileged roles
 *  - No blacklist, no pause, no future minting
 *  - Fully immutable and censorship-resistant
 *
 *  Security Statement:
 *  - No privileged access paths exist
 *  - No external calls are performed
 *  - No mutable parameters after deployment
 *  - No upgradeability or governance hooks
 *
 *  This contract is intentionally minimal and avoids all centralized controls.
 *  Behavior strictly follows OpenZeppelin ERC20 standards.
 * ─────────────────────────────────────────────────────────────────────────────
 */

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/utils/introspection/ERC165.sol";

/// @title Lunzy (LNZ)
/// @author —
/// @notice Immutable, ownerless, zero-tax ERC20 token with EIP-2612 Permit support
/// @dev
/// Security-oriented design:
/// - No privileged roles
/// - No upgradeability
/// - No minting after deployment
/// - No blacklist or pause mechanisms
/// - ERC165 supported for interface detection
///
/// Audit intent:
/// This contract is designed such that no security issues are expected
/// under standard ERC20 and EIP-2612 threat models.
contract Lunzy is ERC20, ERC20Permit, ERC165 {

    /// @notice Total token supply (fixed and immutable)
    /// @dev This value can never change after deployment
    uint256 public constant TOTAL_SUPPLY =
        5_000_000_000_000 * 10 ** 18; // 5 Trillion LNZ

    /// @notice Deploys the contract and mints the entire supply to the deployer
    /// @dev `_mint` is callable only within this constructor
    constructor()
        ERC20("Lunzy", "LNZ")
        ERC20Permit("Lunzy")
    {
        _mint(msg.sender, TOTAL_SUPPLY);
    }

    /**
     * @notice Internal balance update hook
     * @dev
     * This override is intentional and preserves standard ERC20 behavior.
     * - No transfer fees
     * - No burns
     * - No restrictions
     * - No conditional logic
     *
     * Included for explicit audit clarity.
     */
    function _update(
        address from,
        address to,
        uint256 amount
    ) internal virtual override {
        super._update(from, to, amount);
    }

    /**
     * @notice ERC165 interface detection
     * @dev Supports ERC165 itself and inherited interfaces
     * @param interfaceId The interface identifier as defined in ERC165
     * @return True if the interface is supported
     */
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
