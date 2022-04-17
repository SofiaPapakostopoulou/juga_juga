import 'package:flutter/material.dart';
import 'package:juga_juga/screens/home_page.dart';
import 'package:juga_juga/screens/JJ.dart';
import 'package:juga_juga/screens/JJWild.dart';
import 'package:juga_juga/screens/JJGame.dart';
import 'package:juga_juga/screens/Settings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() => runApp(JugaJuga());

class JugaJuga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      ],
      initialRoute: '/',
      routes: {
        //'/': (context) => HomePage(),
        '/JJ': (context) => JJ(),
        '/JJWild': (context) => JJWild(),
        '/JJGame': (context) => JJGame(),
        '/Settings': (context) => Settings(),
      },
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF261A5D),
        scaffoldBackgroundColor: Color(0xFF261A5D),
      ),
      home: HomePage(),
    );
  }
}