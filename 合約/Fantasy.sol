pragma solidity ^0.5.0;

contract Ready {


  address public owner;

  uint public MaxPlayer;
  uint public TeamIndex;

  address[] public players;

  mapping(address => mapping(uint => Ateam)) League;
  mapping(uint => address) TeamOwner;

  modifier ownerOnly(){
    require(msg.sender == owner);
    _;
  }


  constructor() public {
      MaxPlayer = 0;
      TeamIndex = 0;
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

  function createTeam(string memory _name) public {
    //ˇˇˇ來源:助教 =)
    TeamIndex++;
    Ateam memory Team = Ateam(TeamIndex, _name, msg.sender);
    League[msg.sender][TeamIndex] = Team;
    TeamOwner[TeamIndex] = msg.sender;


  }


  struct Ateam{
    uint id;
    string name;
    address add;


  }


}


//資料來源 https://medium.com/@cwlai.unipattern/%E5%8D%80%E5%A1%8A%E9%8F%88-%E4%BB%A5%E5%A4%AA%E5%9D%8A-%E7%8E%A9%E6%A8%82%E9%80%8F-5381c556a071
