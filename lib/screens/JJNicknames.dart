import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juga_juga/screens/Rules.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:juga_juga/components/round_icon_button.dart';

class JJNicknames extends StatefulWidget {
  final int numberOfPlayers;
  final int numberOfStacks;
  JJNicknames(this.numberOfPlayers, this.numberOfStacks);

  @override
  _JJNicknamesState createState() => _JJNicknamesState();
}

class _JJNicknamesState extends State<JJNicknames> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: 50.0),
          Column(
            children: <Widget>[
              Container(
                width: 365.0,
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Text(AppLocalizations.of(context)!.playerNo + (1).toString(),
                    //     style: TextStyle(
                    //         overflow: TextOverflow.fade,
                    //         fontFamily: 'Fredericka the Great',
                    //         fontSize: 20.0)),
                    const TextField(
                      maxLength: 15,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'player nr. 1',
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

              Container(
                width: 365.0,
                height: 120.0,
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              //Expanded(child: Container()),
              SizedBox(
                width: 365.0,
                height: 40.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple[100], // background
                      onPrimary: Colors.white,
                      // foreground
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => new Rules(
                              widget.numberOfPlayers, widget.numberOfStacks, [])));
                    },
                    child: Text(AppLocalizations.of(context)!.letsGoButton,
                        style: TextStyle(
                            overflow: TextOverflow.fade,
                            fontFamily: 'Fredericka the Great',
                            fontSize: 20.0))),
              ),
              SizedBox(height: 50.0)
            ],
          ),
        ],
      ),
    );
  }
}
