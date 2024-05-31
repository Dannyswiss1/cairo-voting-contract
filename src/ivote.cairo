use starknet::ContractAddress;

#[starknet::interface]
pub trait VotingContractTrait<T> {
    #[abi(embed_v0)]
    fn register_voter(ref self: T);

    #[abi(embed_v0)]
    fn add_candidate(ref self: T, candidate: ContractAddress);

    #[abi(embed_v0)]
    fn cast_vote(ref self: T, candidate: ContractAddress);

    #[abi(embed_v0)]
    fn declare_winner(ref self: T);
}