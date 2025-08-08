# Simple Escrow Move Smart Contract

This project contains a simple escrow smart contract written in Move for the Aptos blockchain.

## Features

- Lock funds in escrow between a sender and a receiver
- Release funds to the receiver by the sender

## Contract Overview

- `create_escrow(sender, receiver, amount)`: Sender locks funds for the receiver.
- `release_escrow(sender)`: Sender releases funds to the receiver.

## Reference

This contract is inspired by the Aptos beginner idea: **Simple Escrow**.

## Usage

1. Deploy the contract to Aptos.
2. Call `create_escrow` to lock funds.
3. Call `release_escrow` to release funds to the receiver.

---

For more details, see the `sources/` directory.

---

**Author:** prince maurya
