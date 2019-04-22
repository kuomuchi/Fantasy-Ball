pragma solidity ^0.5.0;

contract Ready {

  address public owner;
  uint MaxPlayer = 0;
  address[] public players;

  modifier ownerOnly(){
    require(msg.sender == owner);
    _;
  }

    constructor() public payable {

      owner == msg.sender;
  }


  function price() public payable {
    //ˇˇˇ假設一個玩家可以有12個球員，SBL總共有146名成員，所以應該可以容納10個玩家。
    require(MaxPlayer < 11);
    //ˇˇˇ玩家付入場費(應該可以這樣寫？)
    require(msg.value > .0001 ether);
    MaxPlayer++;
    players.push(msg.sender);
  }





  struct Ateam{
    string name;
    uint id;
    address add;


  }


}


//資料來源 https://medium.com/@cwlai.unipattern/%E5%8D%80%E5%A1%8A%E9%8F%88-%E4%BB%A5%E5%A4%AA%E5%9D%8A-%E7%8E%A9%E6%A8%82%E9%80%8F-5381c556a071
