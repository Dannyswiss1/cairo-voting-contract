// // use starknet::storage;
// // use starknet::storage::Mapping as SMapping;
// // use starknet::{
// //     ContractAddress,
// //     get_caller_address,
// //     get_contract_address,
// // };

// use starknet::storage;
// use starknet::storage::mapping::Mapping;
// use starknet::storage::Mapping as SMapping;
// use starknet::{
//     ContractAddress,
//     get_caller_address,
//     get_contract_address,
// };

// #[starknet::contract]

// pub struct VotingContract {

//     #[storage]
//     struct Storage {
//         voters: SMapping<ContractAddress, bool>,
//         candidates: SMapping<ContractAddress, u256>,
//         votes: SMapping<ContractAddress, u256>,
//         winner: ContractAddress,
//     }

//     #[event]
//     enum Event {
//         VoterRegistered: VoterRegistered,
//         CandidateAdded: CandidateAdded,
//         VoteCast: VoteCast,
//         WinnerDeclared: WinnerDeclared,
//     }

//     #[derive(Drop, starknet::Event)]
//     struct VoterRegistered {
//         voter: ContractAddress,
//     }

//     #[derive(Drop, starknet::Event)]
//     struct CandidateAdded {
//         candidate: ContractAddress,
//     }

//     #[derive(Drop, starknet::Event)]
//     struct VoteCast {
//         voter: ContractAddress,
//         candidate: ContractAddress,
//     }

//     #[derive(Drop, starknet::Event)]
//     struct WinnerDeclared {
//         winner: ContractAddress,
//     }

//     #[constructor]
//     fn constructor(ref self: ContractState) {
//         // Initialize storage
//     }

//     impl VotingContractTrait for VotingContract {
//         #[abi(embed_v0)]
//         fn register_voter(&self) {
//             let caller: ContractAddress = get_caller_address();
//             self.storage().voters.insert(caller, true);
//             self.emit(VoterRegistered { voter: caller });
//         }

//         #[abi(embed_v0)]
//         fn add_candidate(&self, candidate: ContractAddress) {
//             self.storage().candidates.insert(candidate, 0);
//             self.emit(CandidateAdded { candidate });
//         }

//         #[abi(embed_v0)]
//         fn cast_vote(&self, candidate: ContractAddress) {
//             let caller: ContractAddress = get_caller_address();
//             assert!(self.storage().voters.contains_key(&caller), "Not a registered voter");
//             assert!(self.storage().candidates.contains_key(&candidate), "Invalid candidate");
//             let mut votes = self.storage().votes.get(&candidate).unwrap_or(0);
//             votes += 1;
//             self.storage().votes.insert(candidate, votes);
//             self.emit(VoteCast { voter: caller, candidate });
//         }

//         #[abi(embed_v0)]
//         fn declare_winner(&self) {
//             let mut winner: ContractAddress = ContractAddress::default();
//             let mut max_votes: u256 = 0;
//             for (candidate, votes) in self.storage().candidates.iter() {
//                 if votes > max_votes {
//                     winner = candidate;
//                     max_votes = votes;
//                 }
//             }
//             self.storage().winner.write(winner);
//             self.emit(WinnerDeclared { winner });
//         }
//     }
// }

// use starknet::storage;
// use starknet::storage::mapping::Mapping;
// use starknet::storage::Mapping as SMapping;
// use starknet::{
//     ContractAddress,
//     get_caller_address,
//     get_contract_address,
// };

// #[starknet::contract]
// pub struct VotingContract {
//     #[storage]
//     struct Storage {
//         voters: SMapping<ContractAddress, bool>,
//         candidates: SMapping<ContractAddress, u256>,
//         votes: SMapping<ContractAddress, u256>,
//         winner: ContractAddress,
//     }

//     #[event]
//     enum Event {
//         VoterRegistered: VoterRegistered,
//         CandidateAdded: CandidateAdded,
//         VoteCast: VoteCast,
//         WinnerDeclared: WinnerDeclared,
//     }

//     #[derive(Drop, starknet::Event)]
//     struct VoterRegistered {
//         voter: ContractAddress,
//     }

//     #[derive(Drop, starknet::Event)]
//     struct CandidateAdded {
//         candidate: ContractAddress,
//     }

//     #[derive(Drop, starknet::Event)]
//     struct VoteCast {
//         voter: ContractAddress,
//         candidate: ContractAddress,
//     }

//     #[derive(Drop, starknet::Event)]
//     struct WinnerDeclared {
//         winner: ContractAddress,
//     }

//     #[constructor]
//     fn constructor(ref self: ContractState) {
//         // Initialize storage
//     }

//     impl VotingContractTrait<VotingContract> for VotingContract {
//         #[abi(embed_v0)]
//         fn register_voter(&self) {
//             let caller: ContractAddress = get_caller_address();
//             self.storage().voters.insert(caller, true);
//             self.emit(VoterRegistered { voter: caller });
//         }

//         #[abi(embed_v0)]
//         fn add_candidate(&self, candidate: ContractAddress) {
//             self.storage().candidates.insert(candidate, 0);
//             self.emit(CandidateAdded { candidate });
//         }

//         #[abi(embed_v0)]
//         fn cast_vote(&self, candidate: ContractAddress) {
//             let caller: ContractAddress = get_caller_address();
//             assert!(self.storage().voters.contains_key(&caller), "Not a registered voter");
//             assert!(self.storage().candidates.contains_key(&candidate), "Invalid candidate");
//             let mut votes = self.storage().votes.get(&candidate).unwrap_or(0);
//             votes += 1;
//             self.storage().votes.insert(candidate, votes);
//             self.emit(VoteCast { voter: caller, candidate });
//         }

//         #[abi(embed_v0)]
//         fn declare_winner(&self) {
//             let mut winner: ContractAddress = ContractAddress::default();
//             let mut max_votes: u256 = 0;
//             for (candidate, votes) in self.storage().candidates.iter() {
//                 if votes > max_votes {
//                     winner = candidate;
//                     max_votes = votes;
//                 }
//             }
//             self.storage().winner.write(winner);
//             self.emit(WinnerDeclared { winner });
//         }
//     }
// }

// use starknet::{ContractAddress, Contract};
// use starknet::prelude::*;
// use std::collections::HashMap;

// // Assuming the VotingContractTrait is defined as shown in your question
// use super::VotingContractTrait;

// pub struct VotingContract {
//     voters: Vec<String>,
//     candidates: Vec<ContractAddress>,
//     votes: HashMap<ContractAddress, u64>,
// }

// impl VotingContractTrait for VotingContract {
//     fn register_voter(&mut self, voter_address: String) {
//         self.voters.push(voter_address);
//     }

//     fn add_candidate(&mut self, candidate: ContractAddress) {
//         self.candidates.push(candidate);
//     }

//     fn cast_vote(&mut self, voter_address: String, candidate: ContractAddress) {
//         if!self.voters.contains(&voter_address) {
//             panic!("Invalid voter");
//         }
//         if!self.candidates.contains(&candidate) {
//             panic!("Invalid candidate");
//         }
//         *self.votes.entry(candidate).or_insert(0) += 1;
//     }

//     fn declare_winner(&mut self) -> Option<ContractAddress> {
//         let mut max_votes = 0;
//         let mut winner = None;
//         for (address, &votes) in self.votes.iter() {
//             if votes > max_votes {
//                 max_votes = votes;
//                 winner = Some(*address);
//             }
//         }
//         winner
//     }
// }

// impl VotingContract {
//     pub fn new() -> Self {
//         VotingContract {
//             voters: Vec::new(),
//             candidates: Vec::new(),
//             votes: HashMap::new(),
//         }
//     }
// }
