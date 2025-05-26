// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KarmaFund {
    address public owner;
    uint public proposalCount;
    bool public votingEnded;

    struct Proposal {
        address payable recipient;
        string description;
        uint voteCount;
    }

    mapping(uint => Proposal) public proposals;
    mapping(address => bool) public hasVoted;
    mapping(address => bool) public hasContributed;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can do this");
        _;
    }

    // Contribute ETH to the fund
    function contribute() public payable {
        require(msg.value > 0, "Must send ETH");
        hasContributed[msg.sender] = true;
    }

    // Submit a proposal for the funds
    function submitProposal(address payable _recipient, string memory _description) public {
        proposals[proposalCount] = Proposal(_recipient, _description, 0);
        proposalCount++;
    }

    // Vote for a proposal
    function vote(uint _proposalId) public {
        require(hasContributed[msg.sender], "Only contributors can vote");
        require(!hasVoted[msg.sender], "Already voted");
        require(!votingEnded, "Voting ended");
        require(_proposalId < proposalCount, "Invalid proposal");

        proposals[_proposalId].voteCount++;
        hasVoted[msg.sender] = true;
    }

    // End voting and transfer funds to the winning proposal
    function endVoting() public onlyOwner {
        require(!votingEnded, "Already ended");
        votingEnded = true;

        uint highestVotes = 0;
        uint winnerId;

        for (uint i = 0; i < proposalCount; i++) {
            if (proposals[i].voteCount > highestVotes) {
                highestVotes = proposals[i].voteCount;
                winnerId = i;
            }
        }

        proposals[winnerId].recipient.transfer(address(this).balance);
    }

    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }
}
