module MyModule::SimpleEscrow {
    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    struct Escrow has key, store {
        sender: address,
        receiver: address,
        amount: u64,
        released: bool,
    }

    /// Initialize escrow: sender locks funds for receiver
    public fun create_escrow(sender: &signer, receiver: address, amount: u64) {
        let coins = coin::withdraw<AptosCoin>(sender, amount);
        let escrow = Escrow {
            sender: signer::address_of(sender),
            receiver,
            amount,
            released: false,
        };
        move_to(sender, escrow);
        coin::deposit<AptosCoin>(signer::address_of(sender), coins); // Hold in sender's account
    }

    /// Release funds to receiver (can only be called by sender)
    public fun release_escrow(sender: &signer) acquires Escrow {
        let escrow = borrow_global_mut<Escrow>(signer::address_of(sender));
        assert!(!escrow.released, 1);
        let coins = coin::withdraw<AptosCoin>(sender, escrow.amount);
        coin::deposit<AptosCoin>(escrow.receiver, coins);
        escrow.released = true;
    }
}