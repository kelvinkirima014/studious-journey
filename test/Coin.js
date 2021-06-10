const { expect } = require("chai");

describe("Coin contract", function() {
  it("Deployment should create new coins", async function() {
    const [owner] = await ethers.getSigners();

    const Coin = await ethers.getContractFactory("Coins");

    const subCurrency = await Coin.deploy();

    const ownerBalance = await subCurrency.balanceOf(owner.address);
    expect(await subCurrency.totalSupply()).to.equal(ownerBalance);
  });
});