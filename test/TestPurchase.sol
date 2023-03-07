// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Purchase.sol";

contract TestPurchase {
  // The address of the adoption contract to be tested
  Purchase purchase = Purchase(DeployedAddresses.Purchase());

  // The id of the pet that will be used for testing
  uint expectedPastryId = 8;

  //The expected owner of adopted pet is this contract
  address expectedCustomer = address(this);

  // Testing the adopt() function
  function testUserCanPurchasePastry() public {
    uint returnedId = purchase.purchase(expectedPastryId);

    Assert.equal(returnedId, expectedPastryId, "Adoption of the expected pet should match what is returned.");
  }

  // Testing retrieval of a single pet's owner
  function testGetAdopterAddressByPastryId() public {
    address customer = purchase.customers(expectedPastryId);

    Assert.equal(customer, expectedCustomer, "Owner of the expected pet should be this contract");
  }

  // Testing retrieval of all pet owners
  function testGetAdopterAddressByPetIdInArray() public {
    // Store adopters in memory rather than contract's storage
    address[8] memory customers = purchase.getCustomers();

    Assert.equal(customers[expectedPastryId], expectedCustomer, "Owner of the expected pet should be this contract");
  }

}
