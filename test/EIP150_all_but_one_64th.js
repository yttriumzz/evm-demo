describe("EIP150_all_but_one_64th", function() {
  it("EIP150_all_but_one_64th", async function () {
    const Contract = await ethers.getContractFactory("EIP150_all_but_one_64th");
    const deploy = await Contract.deploy();

    console.log("===== call external_func =====");
    await deploy.test(0);
    console.log("");

    console.log("====== call public_func ======");
    await deploy.test(1);
    console.log("");

    console.log("====== call private_func =====");
    await deploy.test(2);
    console.log("");
  })
})