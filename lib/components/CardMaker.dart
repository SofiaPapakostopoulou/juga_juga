import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

class CardMaker {

  PlayingCardViewStyle myCardStyles = PlayingCardViewStyle(suitStyles: {
    Suit.spades: SuitStyle(
        builder: (context) =>
            FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                "🕴🏽",
                style: TextStyle(fontSize: 500),
              ),
            ),
        style: TextStyle(color: Colors.brown),
        cardContentBuilders: {
          CardValue.jack: (context) =>
              Image.asset("card_images/js.png"),
          CardValue.queen: (context) =>
              Image.asset("card_images/qs.png"),
          CardValue.king: (context) =>
              Image.asset("card_images/ks.png"),
        }),
    Suit.clubs: SuitStyle(
        builder: (context) =>
            FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                "🪢",
                style: TextStyle(fontSize: 500),
              ),
            ),
        style: TextStyle(color: Colors.brown),
        cardContentBuilders: {
          CardValue.jack: (context) =>
              Image.asset("card_images/jc.png"),
          CardValue.queen: (context) =>
              Image.asset("card_images/qc.png"),
          CardValue.king: (context) =>
              Image.asset("card_images/KC.png"),
        }),
    Suit.diamonds: SuitStyle(
        builder: (context) =>
            FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                "🎓",
                style: TextStyle(fontSize: 500),
              ),
            ),
        style: TextStyle(color: Colors.brown),
        cardContentBuilders: {
          CardValue.jack: (context) =>
              Image.asset("card_images/jc.png"),
          CardValue.queen: (context) =>
              Image.asset("card_images/qc.png"),
          CardValue.king: (context) =>
              Image.asset("card_images/KC.png"),
        }),
    Suit.hearts: SuitStyle(
        builder: (context) =>
            FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                "☂️",
                style: TextStyle(fontSize: 500),
              ),
            ),
        style: TextStyle(color: Colors.brown),
        cardContentBuilders: {
          CardValue.jack: (context) =>
              Image.asset("card_images/jc.png"),
          CardValue.queen: (context) =>
              Image.asset("card_images/qc.png"),
          CardValue.king: (context) =>
              Image.asset("card_images/KC.png"),
        })
  });
  ShapeBorder shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(color: Colors.black, width: 1));


  List<PlayingCard> getCards() {
    List<PlayingCard> x = standardFiftyTwoCardDeck();
    x.shuffle();
    return x;
  }

  List<int> IndexMaker(){
    List<int> list_a = Iterable<int>.generate(52).toList();
    list_a.shuffle();
    print(list_a);
    return list_a;
  }


}