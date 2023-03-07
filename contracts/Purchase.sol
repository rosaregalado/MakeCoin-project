// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract Purchase {
  // customers use their wallet address
  address[8] public customers;

  function purchase(uint pastryId) public returns (uint) {
    require(pastryId >= 0 && pastryId <= 8);

    customers[pastryId] = msg.sender;

    return pastryId;
  }

  // Retrieving the customers
  function getCustomers() public view returns (address[8] memory) {
    return customers;
  }

}
