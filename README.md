# CBDC-Negotiable-Transaction-System
Blockchain-based CBDC Negotiable Transaction Framework using Smart Contracts

## Overview

The CBDC Negotiable Transaction System is a blockchain-based framework designed to facilitate secure, transparent, and programmable negotiable transactions using Central Bank Digital Currency (CBDC). The system leverages Ethereum smart contracts to automate transaction execution, validation, consensus verification, and auditing while ensuring trust among participating entities.

This project demonstrates how blockchain technology can improve the efficiency, security, and transparency of negotiable financial transactions by replacing traditional manual processes with automated smart contract execution.

---

## Features

* User Registration using Public Shareable ID (PubSID) and Private ID
* Smart Contract Deployment for negotiable transactions
* Contract Validation Mechanism
* Consensus Verification Process
* CBDC Transfer Execution
* Transaction Audit Trail
* Blockchain-based Transparency and Security

---

## Technology Stack

* Solidity
* Ethereum Blockchain
* Remix IDE
* Smart Contracts
* Blockchain Technology

---

## Workflow

1. User Registration
2. Smart Contract Deployment
3. Contract Validation
4. Consensus Execution
5. CBDC Transfer
6. Transaction Audit and Verification

---

## Project Architecture

Sender → Smart Contract Deployment → Contract Validation → Consensus Verification → CBDC Transfer → Audit Trail

---

## Test Cases

### Test Case 1: User Registration

**Objective:** Verify successful registration of participants in the CBDC network.

**Input:**

* User 1: AMITA1234567890
* User 2: SANIYA123456789

**Expected Result:**

* Users should be registered successfully.
* UserRegistered event should be generated.

**Actual Result:**

* Both users were registered successfully.
* UserRegistered events were emitted.

**Status:** Pass

---

### Test Case 2: Smart Contract Deployment

**Objective:** Verify successful deployment of a negotiable transaction smart contract.

**Input:**

* Receiver Address
* Amount: 150 CBDC
* Transaction Terms

**Expected Result:**

* Smart contract should be deployed.
* ContractDeployed event should be generated.

**Actual Result:**

* Contract deployed successfully.
* ContractDeployed event emitted.

**Status:** Pass

---

### Test Case 3: CBDC Transfer After Consensus

**Objective:** Verify secure CBDC transfer after validation and consensus approval.

**Input:**

* Transaction Amount: 150 CBDC

**Process:**

1. Validate smart contract
2. Execute consensus
3. Transfer CBDC

**Expected Result:**

* Validation successful
* Consensus achieved
* CBDC transferred successfully

**Actual Result:**

* ContractValidated event generated
* ConsensusAchieved event generated
* CBDCTransferred event generated

**Balance Calculation:**

Initial Receiver Balance = 1000 CBDC

Transferred Amount = 150 CBDC

Final Receiver Balance = 1150 CBDC

**Status:** Pass

---

### Test Case 4: Transaction Audit and Verification

**Objective:** Verify transaction completion and audit trace generation.

**Expected Result:**

* Complete transaction lifecycle should be verifiable.

**Actual Result:**

* Contract Deployment Verified
* Contract Validation Verified
* Consensus Verification Verified
* CBDC Transfer Verified
* Audit Trail Generated

**Status:** Pass

## Results

All test cases were executed successfully using Remix Ethereum VM. The smart contract demonstrated secure user registration, contract deployment, validation, consensus execution, CBDC transfer, and transaction auditing.

---

## Future Scope

* Integration with real CBDC platforms
* Cross-border CBDC settlements
* Enhanced consensus mechanisms
* AI-based fraud detection
* ESG-aware digital financial infrastructure

---

## Author

**Amita Jethani**

Computer Science Engineering Student
Symbiosis Institute of Technology, Pune

---

## License

This project is licensed under the MIT License.

