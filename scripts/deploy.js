// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  try {
    const initBalance = 1;

    // Get the contract factory
    const Workspace = await hre.ethers.getContractFactory("Workspace");

    // Deploy the contract
    const workspace = await Workspace.deploy(initBalance);
    await workspace.deployed();

    // Print deployment information
    console.log(`A contract with a balance of ${initBalance} ETH deployed to ${workspace.address}`);
  } catch (error) {
    console.error(error);
    process.exitCode = 1;
  }
}

// Call the main function
main();
