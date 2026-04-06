// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Leagues of Votann Encounter Log
/// @notice Records Ork encounters with Kinholds, castes, and Votann directives.
/// @dev Unique to Votann due to their ancestor-core logic and caste structure.

contract VotannEncounterLog {

    address constant EXAMPLE_ADDRESS = 0x0000000000000000000000000000000000000001;

    struct Encounter {
        string kinhold;          // Ymyr, Kronus, Urani-Surtr, etc.
        string caste;            // Hearthkyn, Ironkyn, Thunderkyn, etc.
        string votannDirective;  // Judgment, calculation, or core directive
        string battleSummary;    // One-line Ork-style summary of battle + result
        address creator;
        uint256 approved;
        uint256 rejected;
        uint256 createdAt;
    }

    Encounter[] public logs;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event EncounterRecorded(uint256 indexed id, string kinhold, address indexed creator);
    event EncounterVoted(uint256 indexed id, bool approved, uint256 approvedVotes, uint256 rejectedVotes);

    constructor() {
        logs.push(
            Encounter({
                kinhold: "Example Kinhold (Fill your own below)",
                caste: "Example caste",
                votannDirective: "Example directive",
                battleSummary: "Example battle summary.",
                creator: EXAMPLE_ADDRESS,
                approved: 0,
                rejected: 0,
                createdAt: block.timestamp
            })
        );
    }

    function recordEncounter(
        string calldata kinhold,
        string calldata caste,
        string calldata votannDirective,
        string calldata battleSummary
    ) external {
        require(bytes(kinhold).length > 0, "Kinhold required");

        logs.push(
            Encounter({
                kinhold: kinhold,
                caste: caste,
                votannDirective: votannDirective,
                battleSummary: battleSummary,
                creator: msg.sender,
                approved: 0,
                rejected: 0,
                createdAt: block.timestamp
            })
        );

        emit EncounterRecorded(logs.length - 1, kinhold, msg.sender);
    }

    function voteEncounter(uint256 id, bool approved) external {
        require(id < logs.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        Encounter storage e = logs[id];

        if (approved) {
            e.approved += 1;
        } else {
            e.rejected += 1;
        }

        emit EncounterVoted(id, approved, e.approved, e.rejected);
    }

    function totalEncounters() external view returns (uint256) {
        return logs.length;
    }
}
