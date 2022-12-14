import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juga_juga/components/Player.dart';
import 'package:juga_juga/screens/JJGame.dart';
import 'package:juga_juga/screens/Rules.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:juga_juga/components/round_icon_button.dart';

class Nickname extends StatefulWidget {
  final int numberOfPlayers;
  final int numberOfStacks;
  final int index;
  List<Player> PlayerList;
  Nickname(
      this.numberOfPlayers, this.numberOfStacks, this.index, this.PlayerList);

  @override
  _NicknameState createState() => _NicknameState();
}

class _NicknameState extends State<Nickname> {
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 70.0),
            Column(
              children: <Widget>[
                Container(
                  width: 365.0,
                  height: 300.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                          AppLocalizations.of(context)!.addName +
                              (widget.index + 1).toString(),
                          style: TextStyle(
                              overflow: TextOverflow.fade,
                              fontFamily: 'Source Code Pro',
                              fontSize: 25.0)),
                      //SizedBox(height: 50),
                      TextField(
                        controller: myController,
                        keyboardType: TextInputType.name,
                        maxLength: 15,
                        style: TextStyle(
                            overflow: TextOverflow.fade,
                            fontFamily: 'Source Code Pro',
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.name,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black26, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            contentPadding: EdgeInsets.all(20.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26)),
                            //labelText: AppLocalizations.of(context)!.name
                          ),
                      )
                    ],
                  ),
                  margin: EdgeInsets.all(15.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[100],
                      borderRadius: BorderRadius.circular(10.0)),
                ),

                //Expanded(child: Container()),
                SizedBox(height: 250.0),
                SizedBox(
                  width: 365.0,
                  height: 40.0,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: ElevatedButton(
                            child: Icon(CupertinoIcons.arrow_left, size: 40),
                            onPressed: () {
                              setState(() {
                                if (widget.index == 0) {
                                  null;
                                } else {
                                  Navigator.of(context).pop();
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple[100],
                              onPrimary: Colors.white,
                              shadowColor: Colors.grey,
                              shape: CircleBorder(),

                            )),
                      ),
                      Expanded(child: Row()),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ElevatedButton(
                            child: Icon(CupertinoIcons.arrow_right, size: 40),
                            onPressed: () {
                              setState(() {
                                String name = myController.text;
                                var player = new Player();
                                player.number = widget.index + 1;
                                player.name = name;
                                widget.PlayerList.add(player);

                                if (widget.index + 1 < widget.numberOfPlayers) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => new Nickname(
                                          widget.numberOfPlayers,
                                          widget.numberOfStacks,
                                          widget.index + 1,
                                          widget.PlayerList)));
                                } else if (widget.index + 1 ==
                                    widget.numberOfPlayers) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => new Rules(
                                          widget.numberOfPlayers,
                                          widget.numberOfStacks, widget.PlayerList)));
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple[100],
                              onPrimary: Colors.white,
                              shadowColor: Colors.grey,
                              shape: CircleBorder(),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.0)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
