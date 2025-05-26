KarmaFund is a simple Ethereum smart contract for community-driven micro-grants. Contributors pool ETH into the fund, submit proposals for who should receive the money, and vote on the best proposal. The winning proposal receives all the funds transparently and securely on-chain.

---

## Table of Contents

- [Features](#features)  
- [How It Works](#how-it-works)  
- [Contract Functions](#contract-functions)  
- [Deploying with Remix](#deploying-with-remix)  
- [Usage Guide](#usage-guide)  
- [Security Considerations](#security-considerations)  
- [Future Improvements](#future-improvements)  
- [License](#license)

---

## Features

- Anyone can contribute ETH to the fund.  
- Anyone can submit a proposal requesting funds for a cause or individual.  
- Contributors can vote once for their preferred proposal.  
- Contract owner ends the voting and transfers funds to the winning proposal.  
- Fully on-chain logic for transparency and fairness.

---

## How It Works

1. Contributors send ETH to the contract using `contribute()`.  
2. Users submit proposals with `submitProposal(recipientAddress, description)`.  
3. Contributors vote for their chosen proposal using `vote(proposalId)`.  
4. Contract owner calls `endVoting()` to finalize voting and send funds to the proposal with the most votes.

---

## Contract Functions

| Function               | Description                                          | Access           |
|------------------------|------------------------------------------------------|------------------|
| `contribute()`         | Send ETH and become a contributor                    | Public           |
| `submitProposal()`     | Submit a funding proposal                            | Public           |
| `vote(proposalId)`     | Vote for a proposal (only once per contributor)      | Contributors only|
| `endVoting()`          | End voting and transfer funds to the winning proposal| Owner only       |
| `getContractBalance()` | View current ETH balance in the contract             | Public           |

---

## Deploying with Remix

1. Open [Remix IDE](https://remix.ethereum.org).  
2. Create a new file named `KarmaFund.sol`.  
3. Paste the contract code provided.  
4. Compile using Solidity version `0.8.x` or later.  
5. Go to the "Deploy & Run Transactions" tab.  
6. Select an environment (e.g., JavaScript VM or Injected Web3 for MetaMask).  
7. Deploy the contract and interact with the functions via Remix UI.

---

## Usage Guide

### 💰 Contribute ETH
- Enter a value in ETH (e.g., 0.1).
- Click `contribute()` to donate.
- This also grants the ability to vote later.

### 📝 Submit Proposal
- Provide:
  - A valid recipient Ethereum address.
  - A description of the cause.
- Call `submitProposal(recipientAddress, description)`.

### 🗳️ Vote
- Contributors can vote once using `vote(proposalId)`.
- Proposal ID starts from `0` and increments with each new submission.

### ✅ End Voting
- Only the contract owner can call `endVoting()`.
- The proposal with the highest vote count receives all ETH in the contract.

### 📊 Check Balance
- Call `getContractBalance()` to view total ETH held by the contract.

---

## Security Considerations

- ✅ **One vote per contributor**: Prevents multiple votes from the same address.
- ✅ **Only contributors can vote**: Ensures fair participation.
- ✅ **Only owner can end voting**: Centralized finalization avoids manipulation.
- ⚠️ **No deadline logic**: Anyone can keep submitting/voting unless manually ended.
- ⚠️ **No refund or withdrawal**: Contributions are non-refundable once sent.

---

## Future Improvements

- ⏱️ **Voting Deadline**: Automatically end voting after a set time using Chainlink Keepers.
- 🧾 **Proposal Metadata**: Include images, categories, or links for more context.
- 🏅 **Contributor NFTs**: Mint NFTs to contributors as proof of karma.
- 🌐 **Frontend DApp**: Build a user-friendly interface for non-technical users.
- 🔁 **Vote Change**: Allow contributors to change their vote before voting ends.

---
Transaction hash: (on Remix/Injected Web3 or Testnet):0xa5d7548cac1dc6f50a0f5a3f6f7cc81c644f01f1dd8d41b1e63594070833d62c

Contract Address: 0x643f833fb4f30ffc55958e736ef671de6036b0de

![Screenshot 2025-05-26 144149](https://github.com/user-attachments/assets/4bd297a3-7336-4f6d-89ef-fd536744af0e)

## License

This project is licensed under the **MIT License**.  
You are free to use, modify, and distribute the code with proper attribution.

---

> Made with ❤️ for social impact on the blockchain.
