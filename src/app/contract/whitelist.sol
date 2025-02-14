// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";
// import "@openzeppelin/contracts/utils/Counters.sol";
// import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// contract WhiteList is ERC721, Ownable {
//     mapping(address => bool) public whitelisted;

// function addToWhitelist(address _user) external onlyOwner {
//     whitelisted[_user] = true;
// }

// function removeFromWhitelist(address _user) external onlyOwner {
//     whitelisted[_user] = false;
// }

// function mint() external payable {
//     require(whitelisted[msg.sender], "You are not whitelisted to mint");
//     require(_tokenIdCounter.current() < maxSupply, "All tokens have been minted");

//     uint256 mintPrice = getMintPriceInETH();
//     require(msg.value >= mintPrice, "Insufficient funds");

//     uint256 tokenId = _tokenIdCounter.current();
//     require(!isMinted[tokenId], "Token ID already minted");

//     _safeMint(msg.sender, tokenId);
//     isMinted[tokenId] = true;
//     _tokenIdCounter.increment();

//     emit Minted(msg.sender, tokenId);
// }

// }