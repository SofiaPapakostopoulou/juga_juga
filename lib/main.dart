import 'package:flutter/material.dart';
import 'package:juga_juga/screens/home_page.dart';
import 'package:juga_juga/screens/JJ.dart';
import 'package:juga_juga/screens/JJWild.dart';
import 'package:juga_juga/screens/JJGame.dart';


void main() => runApp(JugaJuga());

class JugaJuga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        //'/': (context) => HomePage(),
        '/JJ': (context) => JJ(),
        '/JJWild': (context) => JJWild(),
        '/JJGame': (context) => JJGame()
      },
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF261A5D),
        scaffoldBackgroundColor: Color(0xFF261A5D),
      ),
      home: HomePage(),
    );
  }
}