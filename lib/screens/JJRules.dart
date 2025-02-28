import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juga_juga/screens/JJGame.dart';
import 'package:juga_juga/components/Player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Rules extends StatefulWidget {
  final int numberOfPlayers;
  final int numberOfStacks;
  List<Player> PlayerList;
  Rules(this.numberOfPlayers, this.numberOfStacks, this.PlayerList);

  @override
  _RulesState createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 800,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                SizedBox(height: 5),
                Text(AppLocalizations.of(context)!.rules,
                    style: TextStyle(
                        fontFamily: 'Source Code Pro',
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text(AppLocalizations.of(context)!.rules_description,
                    style: TextStyle(
                        fontFamily: 'Source Code Pro',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 7),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => new JJGame(
                              widget.numberOfPlayers, widget.numberOfStacks, widget.PlayerList)));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 5.0,
                      primary: Color(0xDA181818),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)
                      ),
                      minimumSize: Size(0, 40)
                    ),
                    child: Text(AppLocalizations.of(context)!.rules_button,
                        style: TextStyle(
                          //color: Color(0xFF261A5D),
                          color: Colors.white,
                            overflow: TextOverflow.fade,
                            fontFamily: 'Source Code Pro',
                            fontSize: 25.0)),
                  ),
                ),
              ],
            ),
          ),
          margin: EdgeInsets.only(left: 20, top: 70, right: 20, bottom: 50),
          //padding: EdgeInsets.all(10.0),
        padding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 15),
          decoration: BoxDecoration(
              color: Color(0xFF594690),
              borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      );
  }
}

