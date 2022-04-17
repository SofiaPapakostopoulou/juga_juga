import 'package:flutter/material.dart';

class GameBrain{

  int numberOfPlayers = 0;
  int numberOfStacks = 0;

  void setNumberOfPlayers(int number){
    List<int> list = Iterable<int>.generate(number).toList();
    for(int i=0; i<number; i++){list[i]++;}
    print(list);
    this.numberOfPlayers = number;
  }

  void setNumberOfStacks(int number){
    this.numberOfStacks = number;
  }

  int getnumberOfPlayers(){
    return numberOfPlayers;
  }

  int getnumberOfStacks(){
    return numberOfStacks;
  }

}