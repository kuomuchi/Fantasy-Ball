pragma solidity ^0.5.0;

contract Ready {

  address public owner;
  uint MaxPlayer = 0;
  address[] public players;

  function controller() public {
    owner == msg.sneder;
  }

  function price() public payable {
    //假設一個玩家可以有12個球員，SBL總共有146名成員，所以應該可以容納10個玩家。
    require(MaxPlayer < 11);
    //玩家付入場費
    require(msg.value > .0001);
    players.push(msg.sender);
  }

}
