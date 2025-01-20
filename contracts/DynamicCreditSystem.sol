// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DynamicCreditSystem is ERC20 {
    struct User {
        uint256 creditScore;      // 用户信用评分
        uint256 totalCollateral; // 用户总抵押金额
        uint256 loanBalance;     // 用户当前贷款余额
    }

    mapping(address => User) public users; // 用户地址映射到其信息
    uint256 public constant INITIAL_CREDIT_SCORE = 100; // 初始信用评分
    uint256 public constant BASE_COLLATERAL_FACTOR = 60; // 初始抵押率 60%
    uint256 public constant MAX_COLLATERAL_FACTOR = 105; // 最高抵押率 105%
    uint256 public constant SCORE_STEP = 10; // 每 10 分信用评分增加抵押率
    uint256 public constant COLLATERAL_STEP_REDUCTION = 5; // 每步抵押率减少 5%
    uint256 public constant EXCHANGE_RATE = 10000; // 1 ETH = 10000 测试代币
    
    event UserRegistered(address indexed user, uint256 creditScore);
    event CollateralDeposited(address indexed user, uint256 ethAmount, uint256 tokenAmount);
    event LoanRepaid(address indexed user, uint256 tokenAmount, uint256 ethReturned, uint256 newCreditScore);

    constructor() ERC20("TestToken", "TT") {
        // 初始代币分配到合约地址
        _mint(address(this), 1000000 * 10 ** decimals()); // 初始铸造 100 万个代币给合约
    }

    /**
     * @dev 确保用户已注册
     */
    modifier onlyRegistered() {
        require(users[msg.sender].creditScore > 0, "User is not registered");
        _;
    }

    /**
     * @dev 注册新用户
     */
    function register() external {
        require(users[msg.sender].creditScore == 0, "User already registered");
        users[msg.sender] = User({
            creditScore: INITIAL_CREDIT_SCORE,
            totalCollateral: 0,
            loanBalance: 0
        });
        emit UserRegistered(msg.sender, INITIAL_CREDIT_SCORE);
    }

    /**
     * @dev 抵押 ETH 并获取测试代币
     */
    function depositCollateral() external payable onlyRegistered {
        require(msg.value > 0, "Must deposit collateral");

        User storage user = users[msg.sender];
        user.totalCollateral += msg.value;

        // 根据信用评分动态计算抵押率
        uint256 collateralFactor = calculateCollateralFactor(user.creditScore);
        uint256 loanAmount = (msg.value * collateralFactor) / 100; // 计算贷款金额（ETH）
        user.loanBalance += loanAmount;

        // 计算发放的测试代币数量
        uint256 tokenAmount = loanAmount * EXCHANGE_RATE;
        _transfer(address(this), msg.sender, tokenAmount); // 从合约发送代币

        emit CollateralDeposited(msg.sender, msg.value, tokenAmount);
    }

    /**
     * @dev 用户归还测试代币并取回抵押的 ETH
     * @param tokenAmount 归还的测试代币数量
     */
    function repayLoan(uint256 tokenAmount) external onlyRegistered {
        User storage user = users[msg.sender];
        require(tokenAmount > 0, "Must repay tokens");

        // 验证用户代币余额
        require(balanceOf(msg.sender) >= tokenAmount, "Insufficient token balance");


        // 计算用户还款金额（测试币）
        uint256 repaymentAmount = (tokenAmount / EXCHANGE_RATE) ;
        require(user.loanBalance >= repaymentAmount, "Repayment exceeds loan balance");

        // 扣减用户的贷款余额
        user.loanBalance -= repaymentAmount;

        // 根据信用评分动态计算抵押率
        uint256 collateralFactor = calculateCollateralFactor(user.creditScore);

        // 计算应返还的 ETH，不能超过用户实际抵押的金额
        repaymentAmount = repaymentAmount * 100 / collateralFactor;
        uint256 ethReturned = repaymentAmount > user.totalCollateral
            ? user.totalCollateral
            : repaymentAmount;

        // 扣减用户的抵押金额
        user.totalCollateral -= ethReturned;

        // 从用户销毁代币并归还给合约
        _transfer(msg.sender, address(this), tokenAmount);

        // 返还 ETH
        (bool success, ) = msg.sender.call{value: ethReturned}("");
        require(success, "ETH transfer failed");

        // 更新信用评分，按实际还款金额计算
        uint256 creditScoreIncrease = (ethReturned * 100) / 1 ether; // 每 1 ETH 增加 100 分
        user.creditScore += creditScoreIncrease;

        emit LoanRepaid(msg.sender, tokenAmount, ethReturned, user.creditScore);
    }

    /**
     * @dev 动态计算抵押率
     */
    function calculateCollateralFactor(uint256 creditScore) public pure returns (uint256) {
        uint256 reductionSteps = (creditScore - INITIAL_CREDIT_SCORE) / SCORE_STEP;
        uint256 reduction = reductionSteps * COLLATERAL_STEP_REDUCTION;
        uint256 factor = BASE_COLLATERAL_FACTOR + reduction;
        if (factor > MAX_COLLATERAL_FACTOR) return MAX_COLLATERAL_FACTOR;
        else return factor;
    }

    /**
     * @dev 查询用户信息
     */
    function getUserInfo(address user) external view returns (uint256 creditScore, uint256 totalCollateral, uint256 loanBalance) {
        User storage u = users[user];
        return (u.creditScore, u.totalCollateral, u.loanBalance);
    }
}
