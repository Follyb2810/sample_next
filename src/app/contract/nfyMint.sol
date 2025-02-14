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
//         bool isPublicMint; // True = Anyone can mint, False = Only creator can mint
//     }

//     Counters.Counter private _tokenIdCounter;
//     uint256 public mintPriceInUSD = 10; // $0.10
//     mapping(uint256 => NFTData) public nftData;
//     AggregatorV3Interface internal priceFeed;

//     event NFTUploaded(address indexed creator, uint256 tokenId, string metadataURI, uint256 maxSupply, bool isPublicMint);
//     event Minted(address indexed minter, uint256 tokenId);
//     event PublicMintUpdated(uint256 tokenId, bool isPublicMint);

//     constructor(
//         string memory name, 
//         string memory symbol, 
//         address _priceFeed // Chainlink price feed address
//     ) ERC721(name, symbol) {
//         priceFeed = AggregatorV3Interface(_priceFeed);
//     }

//     /** 
//      * @dev Upload an NFT with the option to allow public minting.
//      */
//     function uploadNFT(string memory metadataURI, uint256 maxSupply, bool isPublicMint) external {
//         uint256 tokenId = _tokenIdCounter.current();
//         nftData[tokenId] = NFTData({
//             creator: msg.sender,
//             metadataURI: metadataURI,
//             maxSupply: maxSupply,
//             mintedCount: 0,
//             isPublicMint: isPublicMint
//         });
//         _tokenIdCounter.increment();

//         emit NFTUploaded(msg.sender, tokenId, metadataURI, maxSupply, isPublicMint);
//     }

//     /**
//      * @dev Creator can change whether the NFT is public or private minting.
//      */
//     function setPublicMint(uint256 tokenId, bool isPublicMint) external {
//         require(nftData[tokenId].creator == msg.sender, "Not NFT creator");
//         nftData[tokenId].isPublicMint = isPublicMint;

//         emit PublicMintUpdated(tokenId, isPublicMint);
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
//      * @dev Mint NFT (Creator can restrict or allow minting)
//      */
//     function mint(uint256 tokenId) external payable {
//         NFTData storage nft = nftData[tokenId];
//         require(nft.mintedCount < nft.maxSupply, "Max supply reached");

//         // If minting is private, only the creator can mint
//         if (!nft.isPublicMint) {
//             require(msg.sender == nft.creator, "Only creator can mint");
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
