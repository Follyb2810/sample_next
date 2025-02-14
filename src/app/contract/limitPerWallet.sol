

// mapping(address => uint256) public mintCount;
// uint256 public maxMintsPerWallet = 3;

// function setMaxMintsPerWallet(uint256 _max) external onlyOwner {
//     maxMintsPerWallet = _max;
// }

// function mint() external payable {
//     require(mintCount[msg.sender] < maxMintsPerWallet, "Minting limit reached");
//     require(_tokenIdCounter.current() < maxSupply, "All tokens have been minted");

//     uint256 mintPrice = getMintPriceInETH();
//     require(msg.value >= mintPrice, "Insufficient funds");

//     uint256 tokenId = _tokenIdCounter.current();
//     require(!isMinted[tokenId], "Token ID already minted");

//     _safeMint(msg.sender, tokenId);
//     isMinted[tokenId] = true;
//     _tokenIdCounter.increment();
//     mintCount[msg.sender] += 1;

//     emit Minted(msg.sender, tokenId);
// }
// function mintTo(address recipient) external onlyOwner {
//     require(_tokenIdCounter.current() < maxSupply, "All tokens have been minted");

//     uint256 tokenId = _tokenIdCounter.current();
//     require(!isMinted[tokenId], "Token ID already minted");

//     _safeMint(recipient, tokenId);
//     isMinted[tokenId] = true;
//     _tokenIdCounter.increment();

//     emit Minted(recipient, tokenId);
// }
