require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  networks: {
    hardhat: {
      // chainId: 1337,
    },
    crossfiTestnet: {
      chainId: 4157,
    },
  },
};
