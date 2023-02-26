import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:juga_juga/screens/JJ.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    Timer(
        Duration(seconds: 7),
            () =>
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new JJ())));

    return Scaffold(
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset('introgif/Intro.gif'),


          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.sackDollar, color: Colors.white60)),
          //     SizedBox(width: 20),
          //     IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.heart, color: Colors.white60))
          //     //Donation Button
          //     //Rating Button
          //   ],
          // )

        ],
      ),
    );
  }
}
