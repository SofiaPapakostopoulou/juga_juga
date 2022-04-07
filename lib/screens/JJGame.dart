import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

class JJGame extends StatefulWidget {
  @override
  _JJGameState createState() => _JJGameState();
}


class _JJGameState extends State<JJGame> {

  ShapeBorder shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(color: Colors.black, width: 1));
  FlatCardFan(children: <>[
      PlayingCardView(
      card: PlayingCard(Suit.hearts, CardValue.ace),
      showBack: true,
      elevation: 3.0,
      shape: shape),
      PlayingCardView(
      card: PlayingCard(Suit.hearts, CardValue.ace),
      showBack: true,
      elevation: 3.0,
      shape: shape),
      PlayingCardView(
      card: PlayingCard(Suit.hearts, CardValue.ace),
      showBack: true,
      elevation: 3.0,
      shape: shape),
      PlayingCardView(
      card: PlayingCard(Suit.hearts, CardValue.ace),
      elevation: 3.0,
      shape: shape)
      ])

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('Σοφία,'),
          Text('μαύρο, κόκκινο ή πορτοκαλί;'),
          Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.black, width: 1));
                FlatCardFan(children: [
                  PlayingCardView(
                      card: PlayingCard(Suit.hearts, CardValue.ace),
                      showBack: true,
                      elevation: 3.0,
                      shape: shape),
                  PlayingCardView(
                      card: PlayingCard(Suit.hearts, CardValue.ace),
                      showBack: true,
                      elevation: 3.0,
                      shape: shape),
                  PlayingCardView(
                      card: PlayingCard(Suit.hearts, CardValue.ace),
                      showBack: true,
                      elevation: 3.0,
                      shape: shape),
                  PlayingCardView(
                      card: PlayingCard(Suit.hearts, CardValue.ace),
                      elevation: 3.0,
                      shape: shape)
                ])
          )

        ],
      ),
    );
  }
}
