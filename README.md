# Ork Votann Encounter Log

On-chain Ork reports of Leagues of Votann.  
Each entry records:

- Kinhold  
- Caste  
- Votann directive  
- One-line Ork-style battle summary  

Exclusive to Votann due to ancestor-core logic, judgment protocols, and caste structure.

---

## Contract

Deployed on Base:  
`0x912B84865A15938F30F786aB3295A9eCD69370B0`  
https://basescan.org/address/0x912b84865a15938f30f786ab3295a9ecd69370b0#code

Main file: `contracts/VotannEncounterLog.sol`

---

## Example encounter

```solidity
recordEncounter(
  "Ymyr",
  "Hearthkyn",
  "Resource priority shift",
  "Da stunties shot like walkin' turrets, an' da boyz bailed once dey realized da gitz never missed."
);

Voting
voteEncounter(1, true);
voteEncounter(1, false);

---

## Conclusion

This log keeps track of how Orks bump into Votann forces: stubborn kinholds, precise castes, and cold ancestor-core directives.  
Each entry captures da scrap exactly as da boyz remember it — loud, messy, and usually ending with someone callin’ it a “tactical retreat.”  
Voting lets the community decide which encounters truly feel like somethin’ only stunties and Orks could create together.
