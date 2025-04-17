const hre = require("hardhat");

async function main() {
  const Tracking = await hre.ethers.getContractFactory("Tracking");
}

main.catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
