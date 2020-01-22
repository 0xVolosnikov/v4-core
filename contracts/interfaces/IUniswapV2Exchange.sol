pragma solidity =0.5.16;

interface IUniswapV2Exchange {
    event Mint(address indexed sender, uint amount0, uint amount1);
    event Burn(address indexed sender, uint amount0, uint amount1, address indexed to);
    event Swap(address indexed sender, address indexed tokenIn, uint amountIn, uint amountOut, address indexed to);
    event Sync(uint112 reserve0, uint112 reserve1);

    function selector() external view returns (bytes4);
    function factory() external view returns (address);
    function token0() external view returns (address);
    function token1() external view returns (address);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockNumberLast);
    function price0CumulativeLast() external view returns (uint);
    function price1CumulativeLast() external view returns (uint);

    function mint(address to) external returns (uint liquidity);
    function burn(address to) external returns (uint amount0, uint amount1);
    function swap(address tokenIn, uint amountOut, address to) external;
    function skim(address to) external;
    function sync() external;

    function initialize(address, address) external; // only called once by the factory on deploy
}