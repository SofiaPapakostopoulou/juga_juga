import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset('images/shot.png'),
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
          TextButton(
          style: TextButton.styleFrom(
          primary: Colors.white60,
          shadowColor: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/JJWild');
          },
          child: Text('JugaJuga Wild',
              style: TextStyle(
                  fontFamily: 'Fredericka the Great',
                  fontSize: 50.0))
          ),
        ],
      ),
    );
  }
}
