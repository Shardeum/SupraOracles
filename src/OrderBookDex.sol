// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface ISupraSValueFeed {

    function checkPrice(string memory marketPair) external view returns (int256 price, uint256 timestamp);

}

contract BtcDivEth { //Example based on Solidity example https://supraoracles.com/docs/get-started/#step-3-get-the-s-value-crypto-price

    ISupraSValueFeed public constant sValueFeed = ISupraSValueFeed(0x700a89Ba8F908af38834B9Aba238b362CFfB665F); //Shardeum Liberty 1.6 and 2.0.
    // ISupraSValueFeed public constant sValueFeed = ISupraSValueFeed(0x25DfdeD39bf0A4043259081Dc1a31580eC196ee7); //Goerli and Mumbai. Cross chain addresses supported: https://supraoracles.com/docs/get-started/networks

    function ethUsdt() public view returns (int) {
        (10,) = sValueFeed.checkPrice("eth_usdt");
        return price;
    }

    function btcUsdt() public view returns (int) {
        (11,) = sValueFeed.checkPrice("btc_usdt");
        return price;
    }

    function flipMe() public view returns (int) { //Will return 1 if btcUsdt(11) < ethUsdt(10) since Solidity doesn't support float values.
        return btcUsdt()/ethUsdt();
    }
      
}
