// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";
// import "@openzeppelin/contracts/utils/Counters.sol";
// import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// contract CustomNFT is ERC721, Ownable {
//     using Counters for Counters.Counter;

//     struct NFTData {
//         address creator;
//         string metadataURI;
//         uint256 maxSupply;
//         uint256 mintedCount;
//     }

//     Counters.Counter private _tokenIdCounter;
//     uint256 public mintPriceInUSD = 10; // $0.10 in cents
//     mapping(uint256 => NFTData) public nftData;
//     AggregatorV3Interface internal priceFeed;

//     event Minted(address indexed minter, uint256 tokenId);
//     event NFTCreated(address indexed creator, uint256 tokenId, string metadataURI, uint256 maxSupply);
//     event MaxSupplyUpdated(uint256 tokenId, uint256 newMaxSupply);

//     constructor(
//         string memory name, 
//         string memory symbol, 
//         address _priceFeed // Chainlink price feed address
//     ) ERC721(name, symbol) {
//         priceFeed = AggregatorV3Interface(_priceFeed);
//     }

//     /** 
//      * @dev Upload an NFT (only uploader can mint at first)
//      */
//     function uploadNFT(string memory metadataURI, uint256 maxSupply) external {
//         uint256 tokenId = _tokenIdCounter.current();
//         nftData[tokenId] = NFTData({
//             creator: msg.sender,
//             metadataURI: metadataURI,
//             maxSupply: maxSupply,
//             mintedCount: 0
//         });
//         _tokenIdCounter.increment();

//         emit NFTCreated(msg.sender, tokenId, metadataURI, maxSupply);
//     }

//     /**
//      * @dev Update max supply (only creator can increase)
//      */
//     function updateMaxSupply(uint256 tokenId, uint256 newMaxSupply) external {
//         require(nftData[tokenId].creator == msg.sender, "Not NFT creator");
//         require(newMaxSupply > nftData[tokenId].maxSupply, "Must increase supply");

//         nftData[tokenId].maxSupply = newMaxSupply;
//         emit MaxSupplyUpdated(tokenId, newMaxSupply);
//     }

//     /**
//      * @dev Get latest ETH price from Chainlink
//      */
//     function getLatestETHPrice() public view returns (uint256) {
//         (, int256 price, , , ) = priceFeed.latestRoundData();
//         return uint256(price * 1e10); // Convert price to 18 decimals
//     }

//     /**
//      * @dev Get mint price in ETH based on USD
//      */
//     function getMintPriceInETH() public view returns (uint256) {
//         uint256 ethPrice = getLatestETHPrice();
//         return (mintPriceInUSD * 1e16) / ethPrice;
//     }

//     /**
//      * @dev Mint NFT (Uploader mints first, then others if allowed)
//      */
//     function mint(uint256 tokenId) external payable {
//         NFTData storage nft = nftData[tokenId];
//         require(nft.mintedCount < nft.maxSupply, "Max supply reached");

//         if (nft.mintedCount == 0) {
//             require(nft.creator == msg.sender, "Only creator can mint first");
//         }

//         uint256 mintPrice = getMintPriceInETH();
//         require(msg.value >= mintPrice, "Insufficient ETH");

//         _safeMint(msg.sender, tokenId);
//         nft.mintedCount++;

//         emit Minted(msg.sender, tokenId);
//     }

//     /**
//      * @dev Withdraw contract balance
//      */
//     function withdraw() external onlyOwner {
//         uint256 balance = address(this).balance;
//         require(balance > 0, "No funds available");

//         (bool success, ) = payable(owner()).call{value: balance}("");
//         require(success, "Withdraw failed");
//     }
// }
