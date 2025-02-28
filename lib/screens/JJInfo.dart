import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:juga_juga/components/round_icon_button.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:juga_juga/components/GameBrain.dart';
import 'package:juga_juga/screens/JJGame.dart';
import 'package:juga_juga/screens/Nicknames.dart';
import 'package:juga_juga/screens/JJNickname.dart';

import 'package:juga_juga/screens/JJRules.dart';
import 'package:juga_juga/components/Player.dart';

class JJ extends StatefulWidget {
  @override
  _JJState createState() => _JJState();
}


class _JJState extends State<JJ> {

  GameBrain numbers = GameBrain();
  int NumberOfPlayers = 2;
  int selectedButton = 1;
  var isDisable=true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //SizedBox(height: 50.0),
            Column(
              children: <Widget>[
                Container(
                width: 365.0,
                height: 150.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(AppLocalizations.of(context)!.players,
                        style: TextStyle(
                            color: Colors.white,

                        fontFamily: 'Source Code Pro',
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold)),
                    Container(
                      width: 30,
                      alignment: Alignment.center,
                      child: Text(NumberOfPlayers.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Source Code Pro',
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(width:5),
                    Row(
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              if(NumberOfPlayers>2){
                                NumberOfPlayers--;
                              }
                              });
                            },
                        ),
                        SizedBox(width: 5.0),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                          setState(() {
                            NumberOfPlayers++;
                          });
                          })
                  ],),
                ],),
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  //color: Colors.deepPurple[100],
                  color: Color(0xFF594690),
                  borderRadius: BorderRadius.circular(50.0)
                ),
              ),

            Container(
              width: 365.0,
              height: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(AppLocalizations.of(context)!.numberOfPackOfCards,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Source Code Pro',
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold)),
                  // Text(numberOfPlayers.toString(),
                  //     style: TextStyle(
                  //         fontFamily: 'Source Code Pro',
                  //         fontSize: 20.0)),
                  GroupButton(
                    isRadio: true,
                    spacing: 10,
                    elevation: 5.0,
                    onSelected: (index, isSelected) => {
                      selectedButton = index + 1,
                      print(selectedButton),
                    },

                        //print('$index button is selected'),
                    buttons: ["1", "2", "3", "4"],
                    selectedButton: 0,
                    unselectedTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                      borderRadius: BorderRadius.circular(20.0),
                      unselectedColor: Color(0xDA181818),
                    selectedColor: Color(0xFD34363A),
                    buttonHeight: 40.0,
                  ),

                ],),
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  //color: Colors.deepPurple[100],
                  color: Color(0xFF594690),
                  borderRadius: BorderRadius.circular(50.0)
              ),
            ),
               ],
            ),
            Expanded(child: Container()),
            SizedBox(
              width: 365.0,
              height: 60.0,
              child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    //primary: Color(0xC8594690), 0xFF5F6A69
                    primary: Color(0x63000000),
                    shadowColor: Color(0xFF020000),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)
                    ),
                  ),
                  onPressed:  (){

                    List<Player> PlayerList = [];

                    numbers.setNumberOfPlayers(NumberOfPlayers);
                    numbers.setNumberOfStacks(selectedButton);
                    print(numbers.numberOfStacks);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder:(context)=>
                        //new JJNicknames(numbers.getnumberOfPlayers(),numbers.getnumberOfStacks())));
                        new Nickname(numbers.getnumberOfPlayers(),numbers.getnumberOfStacks(),0,PlayerList)));
                  },
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(AppLocalizations.of(context)!.addNicknamesButton,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          //color: Color(0xFF261A5D),
                          color: Color(0xFFF8EBFF),
                            overflow: TextOverflow.fade,
                            fontFamily: 'Source Code Pro',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                        )),
                  )
              ),
            ),
            //SizedBox(height: 20),
            // SizedBox(
            //   width: 365.0,
            //   height: 40.0,
            //   child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //         primary: Colors.deepPurple[100], // background
            //         onPrimary: Colors.white,
            //         // foreground
            //       ),
            //       onPressed: (){
            //         numbers.setNumberOfPlayers(NumberOfPlayers);
            //         numbers.setNumberOfStacks(selectedButton+1);
            //
            //         Navigator.of(context).push(
            //             MaterialPageRoute(builder:(context)=>
            //                 new Rules(numbers.getnumberOfPlayers(),numbers.getnumberOfStacks(), [])));
            //       },
            //       child: Text(AppLocalizations.of(context)!.letsGoButton,
            //           style: TextStyle(
            //               overflow: TextOverflow.fade,
            //               fontFamily: 'Source Code Pro',
            //               fontSize: 20.0))
            //   ),
            // ),
            SizedBox(height: 30.0)
          ],
        ),
      ),

    );
  }
}



