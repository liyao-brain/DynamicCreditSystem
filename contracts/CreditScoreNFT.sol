// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CreditScoreNFT is ERC721URIStorage, Ownable {
    uint256 public nextTokenId; // 下一个 NFT 的 Token ID
    mapping(address => uint256) public userToTokenId; // 用户地址到 Token ID 的映射

    constructor() ERC721("CreditScoreNFT", "CSNFT") Ownable(msg.sender) {}

    /**
     * @dev 铸造信用评分 NFT
     * @param user 用户地址
     * @param tokenURI NFT 的元数据 URI
     */
    function mintCreditNFT(address user, string memory tokenURI) external onlyOwner {
        require(userToTokenId[user] == 0, "User already owns a CreditScore NFT"); // 确保用户未注册过
        nextTokenId++;
        _mint(user, nextTokenId);
        _setTokenURI(nextTokenId, tokenURI);
        userToTokenId[user] = nextTokenId;
    }

    /**
     * @dev 销毁旧的信用评分 NFT
     * @param user 用户地址
     */
    function burnUserNFT(address user) external onlyOwner {
        uint256 tokenId = userToTokenId[user];
        require(tokenId > 0, "User does not own a CreditScore NFT");
        _burn(tokenId); // 销毁 NFT
        delete userToTokenId[user]; // 删除映射
    }

    /**
     * @dev 获取用户 NFT 的 Token ID
     * @param user 用户地址
     */
    function getTokenId(address user) external view returns (uint256) {
        return userToTokenId[user];
    }
}
