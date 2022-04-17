import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:juga_juga/components/round_icon_button.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:juga_juga/components/GameBrain.dart';

class JJ extends StatefulWidget {
  @override
  _JJState createState() => _JJState();
}


class _JJState extends State<JJ> {

  int numberOfPlayers = 0;
  int selectedButton = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: 40.0),
          Column(
            children: <Widget>[
              Container(
              width: 365.0,
              height: 120.0,
              child: Row(
                children: <Widget>[
                  Text(AppLocalizations.of(context)!.numberOfPlayers,
                    style: TextStyle(
                    fontFamily: 'Fredericka the Great',
                    fontSize: 20.0)),
                  Text(numberOfPlayers.toString(),
                      style: TextStyle(
                          fontFamily: 'Fredericka the Great',
                          fontSize: 20.0)),
                  SizedBox(width:10),
                  Row(
                    children: <Widget>[
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {
                            if(numberOfPlayers>0){
                              numberOfPlayers--;
                            }
                            });
                          },
                      ),
                      SizedBox(width: 10.0),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                        setState(() {
                          numberOfPlayers++;
                        });
                        })
                ],),
              ],),
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(10.0)
              ),
            ),

          Container(
            width: 365.0,
            height: 120.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(AppLocalizations.of(context)!.numberOfPackOfCards,
                    style: TextStyle(
                        fontFamily: 'Fredericka the Great',
                        fontSize: 20.0)),
                // Text(numberOfPlayers.toString(),
                //     style: TextStyle(
                //         fontFamily: 'Fredericka the Great',
                //         fontSize: 20.0)),
                GroupButton(
                  isRadio: true,
                  spacing: 10,
                  onSelected: (index, isSelected) => selectedButton = index + 1,
                      //print('$index button is selected'),
                  buttons: ["1", "2", "3", "4"],
                  selectedButton: 0,
                  unselectedTextStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                    borderRadius: BorderRadius.circular(5.0),
                    unselectedColor: Color(0xFF4C4F5E),
                  selectedColor: Colors.deepPurple[300],
                  buttonHeight: 40.0,
                ),

              ],),
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(10.0)
            ),
          ),
             ],
          ),
          Expanded(child: Container()),
          SizedBox(
            width: 365.0,
            height: 40.0,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple[100], // background
                  onPrimary: Colors.white,
                  // foreground
                ),
                onPressed: (){
                  GameBrain().setNumberOfPlayers(numberOfPlayers);
                  GameBrain().setNumberOfStacks(selectedButton);
                  Navigator.pushNamed(context, '/JJGame');
                },
                child: Text(AppLocalizations.of(context)!.letsGoButton)
            ),
          ),
          SizedBox(height: 30.0)
        ],
      ),

    );
  }
}



