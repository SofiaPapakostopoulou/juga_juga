import 'package:flutter/material.dart';
import 'package:juga_juga/screens/JJIntro.dart';
import 'package:juga_juga/screens/JJInfo.dart';
import 'package:juga_juga/screens/Wild.dart';
import 'package:juga_juga/screens/JJGame.dart';
import 'package:juga_juga/screens/Settings.dart';
import 'package:juga_juga/screens/JJRules.dart';
import 'package:juga_juga/screens/Nicknames.dart';
import 'package:juga_juga/screens/JJNickname.dart';
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
        Locale('en', ''), // English
        Locale('el', ''), // Greek
        Locale('es', ''), // Spanish
        Locale('ca', ''), // Catalan
        Locale('fr', '')  // French
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