// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";
// import "@openzeppelin/contracts/utils/Counters.sol";
// import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// contract CustomNFT is ERC721, Ownable {
//     using Counters for Counters.Counter;
    
//     Counters.Counter private _tokenIdCounter;
//     string private baseURI;
//     uint256 public mintPriceInUSD = 10; // 10 cents ($0.10)
//     uint256 public maxSupply;
//     mapping(uint256 => bool) public isMinted;

//     AggregatorV3Interface internal priceFeed;

//     event Minted(address indexed minter, uint256 tokenId);

//     constructor(
//         string memory name, 
//         string memory symbol, 
//         string memory _baseURI,
//         address _priceFeed // Chainlink price feed address (varies by network)
//     ) ERC721(name, symbol) {
//         baseURI = _baseURI;
//         priceFeed = AggregatorV3Interface(_priceFeed);
//     }

//     function setBaseURI(string memory _newBaseURI) external onlyOwner {
//         baseURI = _newBaseURI;
//     }

//     function setMintPriceInUSD(uint256 _priceInCents) external onlyOwner {
//         mintPriceInUSD = _priceInCents;
//     }

//     function setMaxSupply(uint256 _maxSupply) external onlyOwner {
//         maxSupply = _maxSupply;
//     }

//     function getLatestETHPrice() public view returns (uint256) {
//         (, int256 price, , , ) = priceFeed.latestRoundData();
//         return uint256(price * 1e10); // Convert price to 18 decimals
//     }

//     function getMintPriceInETH() public view returns (uint256) {
//         uint256 ethPrice = getLatestETHPrice(); // ETH price in USD (18 decimals)
//         return (mintPriceInUSD * 1e16) / ethPrice; // Convert $0.10 to ETH
//     }

//     function mint() external payable {
//         require(_tokenIdCounter.current() < maxSupply, "All tokens have been minted");

//         uint256 mintPrice = getMintPriceInETH();
//         require(msg.value >= mintPrice, "Insufficient funds");

//         uint256 tokenId = _tokenIdCounter.current();
//         require(!isMinted[tokenId], "Token ID already minted");

//         _safeMint(msg.sender, tokenId);
//         isMinted[tokenId] = true;
//         _tokenIdCounter.increment();

//         emit Minted(msg.sender, tokenId);
//     }

//     function withdraw() external onlyOwner {
//         uint256 balance = address(this).balance;
//         require(balance > 0, "No funds to withdraw");

//         (bool success, ) = payable(owner()).call{value: balance}("");
//         require(success, "Withdrawal failed");
//     }

//     function _baseURI() internal view override returns (string memory) {
//         return baseURI;
//     }
// }
