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
  //final myController = TextEditingController();
   bool isButtonActive = false;
   late TextEditingController controller = TextEditingController();
  // final HitTestBehavior behavior = HitTestBehavior.translucent;

  @override
  void initState() {
    super.initState();
    //myController = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;
      const HitTestBehavior behaviorr = HitTestBehavior.translucent;

      setState(() =>
      this.isButtonActive = isButtonActive );
    });
  }

  void dispose() {
    controller.dispose();
    //myController.dispose();
    super.dispose();
  }

  void ShowAlert(String text) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          title: Text(text,
              style: TextStyle(fontFamily: 'Source Code Pro', fontSize: 20.0 , color: Color(0xFF594690), fontWeight: FontWeight.bold)),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                textStyle:
                const TextStyle(fontFamily: 'Source Code Pro', fontSize: 20),
                backgroundColor: Colors.deepPurple[150],
                //backgroundColor: Color(0xFF594690)
              ),
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK', style: TextStyle(fontFamily: 'Source Code Pro', fontSize: 30)),
            ),
          ],
          elevation: 24.0,
          //backgroundColor: Colors.deepPurple[400],
          //backgroundColor: Color(0xFF5F6A69),
          backgroundColor: Color(0xFFF8EBFF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))

      ),
    );
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
                        //controller: myController,
                        controller: controller,
                        keyboardType: TextInputType.name,
                        maxLength: 10,
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
                              borderRadius: BorderRadius.circular(10.0)),
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
                      color: Color(0xFF594690),
                      borderRadius: BorderRadius.circular(50.0)),
                ),

                //Expanded(child: Container()),
                SizedBox(height: 320.0),
                SizedBox(
                  width: 365.0,
                  height: 65.0,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        //height: 400,
                        width: 75,
                        child: ElevatedButton(
                            child: Icon(CupertinoIcons.arrow_left, size: 50),
                            onPressed: () {
                              setState(() {
                                if (widget.index == 0) {
                                  Navigator.of(context).pop();
                                } else {
                                  Navigator.of(context).pop();
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 5.0,
                              primary: Color(0x63000000),
                              shadowColor: Color(0xFF020000),
                              onPrimary: Colors.white,
                              //shadowColor: Colors.grey,
                              //shape: CircleBorder(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              minimumSize: Size(150.0, 150.0),
                            )),
                      ),
                      Expanded(child: Row()),
                      SizedBox(
                        width: 75,
                        //height: 200,
                        child: ElevatedButton(
                            child: Icon(CupertinoIcons.arrow_right,
                                color: Colors.white, size: 50),
                            onPressed: isButtonActive
                                ? () {
                                    setState(() {
                                      isButtonActive = false;
                                      //String name = myController.text;
                                      String name = controller.text;

                                      if (name.length > 10) {
                                        name.substring(0, 9);
                                      }
                                      var player = new Player();
                                      player.number = widget.index + 1;
                                      player.name = name;
                                      widget.PlayerList.add(player);

                                      if (widget.index + 1 <
                                          widget.numberOfPlayers) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    new Nickname(
                                                        widget.numberOfPlayers,
                                                        widget.numberOfStacks,
                                                        widget.index + 1,
                                                        widget.PlayerList)));
                                      }
                                      else if (widget.index + 1 ==
                                          widget.numberOfPlayers) {

                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => new Rules(
                                                    widget.numberOfPlayers,
                                                    widget.numberOfStacks,
                                                    widget.PlayerList)));
                                      }

                                    });
                                  }
                                : null,


                            // onPressed: () {
                            //   setState(() {
                            //     String name = myController.text;
                            //
                            //     if(name.isEmpty){
                            //       ShowAlert("Please enter a name!");
                            //     }
                            //     if(name.length>10){name.substring(0,9);}
                            //     var player = new Player();
                            //     player.number = widget.index + 1;
                            //     player.name = name;
                            //     widget.PlayerList.add(player);
                            //
                            //     if (widget.index + 1 < widget.numberOfPlayers) {
                            //       Navigator.of(context).push(MaterialPageRoute(
                            //           builder: (context) => new Nickname(
                            //               widget.numberOfPlayers,
                            //               widget.numberOfStacks,
                            //               widget.index + 1,
                            //               widget.PlayerList)));
                            //     } else if (widget.index + 1 ==
                            //         widget.numberOfPlayers) {
                            //       Navigator.of(context).push(MaterialPageRoute(
                            //           builder: (context) => new Rules(
                            //               widget.numberOfPlayers,
                            //               widget.numberOfStacks,
                            //               widget.PlayerList)));
                            //     }
                            //   });
                            // },



                            style: ElevatedButton.styleFrom(
                              elevation: 5.0,
                              primary: Color(0x63000000),
                              shadowColor: Color(0xFF020000),
                              //padding: EdgeInsets.all(10),
                              onPrimary: Colors.white,
                              //shadowColor: Colors.grey,
                              // shape: CircleBorder(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              minimumSize: Size(150, 150),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100.0)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
