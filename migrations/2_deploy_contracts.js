const Token = artifacts.require("Token");
const EthSwap = artifacts.require("EthSwap");
const Transfer = artifacts.require("Transfer");

module.exports = async function(deployer) {
  await deployer.deploy(Token);
  const token = await Token.deployed();

  await deployer.deploy(EthSwap, token.address);
  const ethSwap = await EthSwap.deployed();

  // Transfer all token to ethswap
  await token.transfer(ethSwap.address, "1000000000000000000000000");

  await deployer.deploy(Transfer, token.address);
};
