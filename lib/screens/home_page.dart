import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset('profile_image/shot.png'),
          SizedBox(height: 40),
          TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white60,
                shadowColor: Colors.white,
              ),

              onPressed: () {
                Navigator.pushNamed(context, '/JJ');
              },
              child: Text('JugaJuga',
                  style: TextStyle(
                      fontFamily: 'Fredericka the Great',
                      fontSize: 50.0))
          ),
          SizedBox(height: 80),
          // TextButton(
          // style: TextButton.styleFrom(
          // primary: Colors.white60,
          // shadowColor: Colors.white,
          // ),
          // onPressed: () {
          //   Navigator.pushNamed(context, '/JJWild');
          // },
          // child: Text('JugaJuga Wild',
          //     style: TextStyle(
          //         fontFamily: 'Fredericka the Great',
          //         fontSize: 50.0))
          // ),
          SizedBox(height: 150),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.sackDollar, color: Colors.white60)),
              SizedBox(width: 20),
              IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.heart, color: Colors.white60))
              //Donation Button
              //Rating Button
            ],
          )
        ],
      ),
    );
  }
}
