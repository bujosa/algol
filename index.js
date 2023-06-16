import FireFly from "@hyperledger/firefly-sdk";

async function main() {
  const firefly = new FireFly({ host: "http://localhost:5000" });

  await firefly.createContractAPI({
    name: "my-contract",
    interface: {
      name: "my-contract",
      version: "1.0.0",
      id: "my-contract-1",
    },
    location: {
        address: "0x1234",
    }
  });


}

if (require.main === module) {
  main().catch((err) => console.error(`Error: ${err}`));
}
