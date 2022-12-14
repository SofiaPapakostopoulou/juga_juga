import 'package:flutter/material.dart';

class Player{

  int number = 0;
  String name = '';

  // Player({
  //   required this.number,
  //   required this.name,
  // });

  void setNumber(int n){
    number = n;
  }

  int getNumber(){
    return number;
  }

  void setName(String n){
    name = n;
  }

  String getName(){
    return name;
  }

}