import 'package:flutter/material.dart';
import 'package:juga_juga/screens/JJHomePage.dart';
import 'package:juga_juga/screens/JJ.dart';
import 'package:juga_juga/screens/JJWild.dart';
import 'package:juga_juga/screens/JJGame.dart';
import 'package:juga_juga/screens/Settings.dart';
import 'package:juga_juga/screens/Rules.dart';
import 'package:juga_juga/screens/JJNicknames.dart';
import 'package:juga_juga/screens/Nickname.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() => runApp(JugaJuga());

class JugaJuga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Localizations Sample App',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('el', ''), // Greek, no country code
        Locale('es', ''),
        Locale('ca', ''),
        Locale('fr', '')
      ],
      initialRoute: '/',
      routes: {
        //'/': (context) => HomePage(),
        '/JJ': (context) => JJ(),
        '/JJWild': (context) => JJWild(),
        '/JJGame': (context) => JJGame(0,0,const []),
        '/Settings': (context) => Settings(),
        '/Rules': (context) => Rules(0,0,[]),
        '/JJNicknames': (context) => JJNicknames(0,0),
        '/Nickname': (context) => Nickname(0,0,0,const []),
        '/HomePage': (context) => HomePage(),
      },
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF261A5D),
        scaffoldBackgroundColor: Color(0xFF261A5D),
      ),
      home: HomePage(),
    );
  }
}