//SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.0;

//this our first phase of contract of nane hacktu4
contract Hacktu4 {
  struct User {
    uint id;
    string name;
  }
  //array of map value.
  User[] public users;
  //intially we assign 1 because by default it enter 0;
  uint public nextId = 1;


  //this function helps to create data on ethereum chain.
  function create(string memory name) public {
    users.push(User(nextId, name));
    nextId++;
  }

  //this function only readable means we read on data on write.
  function read(uint id) view public returns(uint, string memory) {
    uint i = find(id);
    return(users[i].id, users[i].name);
  }

  //this is the main function that update on chain.
  function update(uint id, string memory name) public {
    uint i = find(id);
    users[i].name = name;
  }

  //this function help us to delete. we use del because delete is keyword in solidity.
  function del(uint id) public {
    uint i = find(id);
    delete users[i];
  }
  //use for all three function to iterate and search the element and perform the operation.
  //this is only function that is called by above 2 function.
  //find the element by linear search.
  function find(uint id) view internal returns(uint) {
    for(uint i = 0; i < users.length; i++) {
      if(users[i].id == id) {
        return i;
      }
    }
    revert('enter User does not exist!');
  }

}