pragma solidity ^0.5.0;

contract Ready {


  address public owner;

  uint public Order;
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
      Order = 0;
      MaxPlayer = 0;
      TeamIndex = 0;
      owner == msg.sender;
  }


   struct Ateam{
    uint id;
    uint Population;
    uint order;
    string name;
    address add;
    //假的array[] YA

  }




  function createTeam(string memory _name) public payable {
    //ˇˇˇ玩家付入場費(應該可以這樣寫？)
    require(msg.value > .0001 ether);
    //ˇˇˇ假設一個玩家可以有12個球員，SBL總共有146名成員，所以應該可以容納10個玩家。
    require(MaxPlayer < 11);
    //ˇˇˇ確認玩家沒有重複
    require(TeamOwner[TeamIndex] != msg.sender);
    //ˇˇˇ來源:助教b
    TeamIndex++;
    MaxPlayer++;
    //ˇˇˇ假設在最後面有一個空幾集合
    Ateam memory Team = Ateam(TeamIndex, MaxPlayer, 0,_name, msg.sender);
    League[msg.sender][TeamIndex] = Team;
    TeamOwner[TeamIndex] = msg.sender;

  }


  function ReadyStart() public ownerOnly{
    //準備要開始遊戲
    require(MaxPlayer > 9);


  }

  ///ˇˇˇ設定球員
  function chooseBP(uint _BPID) public {
    require(TeamOwner[TeamIndex] == msg.sender);
    // 假設現在有一個array是球員array
    //TeamOwner[array.push(_BPID)];  <--不知道可不可以這樣ＸＤ




  }


}


//資料來源 https://medium.com/@cwlai.unipattern/%E5%8D%80%E5%A1%8A%E9%8F%88-%E4%BB%A5%E5%A4%AA%E5%9D%8A-%E7%8E%A9%E6%A8%82%E9%80%8F-5381c556a071
