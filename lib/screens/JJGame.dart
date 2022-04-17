import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:juga_juga/components/GameBrain.dart';
import 'package:juga_juga/components/example_card.dart';
import 'package:juga_juga/components/card_overlay.dart';
import 'package:juga_juga/components/card_label.dart';
import 'package:juga_juga/components/bottom_buttons_row.dart';
import 'package:juga_juga/theme/colors.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:juga_juga/components/CardMaker.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const _images = [
  'playing_cards/ace_of_clubs.png',
  'playing_cards/ace_of_diamonds.png',
  'playing_cards/ace_of_hearts.png',
  'playing_cards/ace_of_spades.png',
  'playing_cards/2_of_clubs.png',
  'playing_cards/2_of_diamonds.png',
  'playing_cards/2_of_hearts.png',
  'playing_cards/2_of_spades.png',
  'playing_cards/3_of_clubs.png',
  'playing_cards/3_of_diamonds.png',
  'playing_cards/3_of_hearts.png',
  'playing_cards/3_of_spades.png',
  'playing_cards/4_of_clubs.png',
  'playing_cards/4_of_diamonds.png',
  'playing_cards/4_of_hearts.png',
  'playing_cards/4_of_spades.png',
  'playing_cards/5_of_clubs.png',
  'playing_cards/5_of_diamonds.png',
  'playing_cards/5_of_hearts.png',
  'playing_cards/5_of_spades.png',
  'playing_cards/6_of_clubs.png',
  'playing_cards/6_of_diamonds.png',
  'playing_cards/6_of_hearts.png',
  'playing_cards/6_of_spades.png',
  'playing_cards/7_of_clubs.png',
  'playing_cards/7_of_diamonds.png',
  'playing_cards/7_of_hearts.png',
  'playing_cards/7_of_spades.png',
  'playing_cards/8_of_clubs.png',
  'playing_cards/8_of_diamonds.png',
  'playing_cards/8_of_hearts.png',
  'playing_cards/8_of_spades.png',
  'playing_cards/9_of_clubs.png',
  'playing_cards/9_of_diamonds.png',
  'playing_cards/9_of_hearts.png',
  'playing_cards/9_of_spades.png',
  'playing_cards/10_of_clubs.png',
  'playing_cards/10_of_diamonds.png',
  'playing_cards/10_of_hearts.png',
  'playing_cards/10_of_spades.png',
  'playing_cards/jack_of_clubs.png',
  'playing_cards/jack_of_diamonds.png',
  'playing_cards/jack_of_hearts.png',
  'playing_cards/jack_of_spades.png',
  'playing_cards/queen_of_clubs.png',
  'playing_cards/queen_of_diamonds.png',
  'playing_cards/queen_of_hearts.png',
  'playing_cards/queen_of_spades.png',
  'playing_cards/king_of_clubs.png',
  'playing_cards/king_of_diamonds.png',
  'playing_cards/king_of_hearts.png',
  'playing_cards/king_of_spades.png',
];



class JJGame extends StatefulWidget {
  @override
  _JJGameState createState() => _JJGameState();
}

class _JJGameState extends State<JJGame> {
  List<PlayingCard> deck = CardMaker().getCards();
  List<int> lista = CardMaker().IndexMaker();
  int indexer = 0;
  int shotCounter = 0;

  // bool isBack = true;
  // double angle = 0;
  //
  // void _flip() {
  //   setState(() {
  //     angle = (angle + pi) % (2 * pi);
  //   });
  // }
  // void _swipe() {
  //   setState(() {
  //     angle = (angle + pi) % (2 * pi);
  //   });
  // }

  late final SwipableStackController _controller;

  void _listenController() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_listenController)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 100.0),
          Text(AppLocalizations.of(context)!.playerNo + (indexer+1).toString() + ',',
              style: TextStyle(
                  fontFamily: 'Fredericka the Great', fontSize: 20.0)),
          Text(AppLocalizations.of(context)!.playerChoose,
              style: TextStyle(
                  fontFamily: 'Fredericka the Great', fontSize: 20.0)),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    //padding: const EdgeInsets.all(20),
                    padding: EdgeInsets.symmetric(vertical:14.0, horizontal: 20.0),
                    child: SwipableStack(
                      detectableSwipeDirections: const {
                        SwipeDirection.right,
                        SwipeDirection.left,
                      },
                      controller: _controller,
                      stackClipBehaviour: Clip.none,
                      onSwipeCompleted: (index, direction) {
                        if(direction==SwipeDirection.left){
                          print(indexer);
                          print(GameBrain().getnumberOfPlayers());
                          if(indexer<GameBrain().numberOfPlayers){
                            AlertDialog(
                              title: Text(AppLocalizations.of(context)!.playerNo
                                  + indexer.toString() + AppLocalizations.of(context)!.youDrink
                                  + shotCounter.toString() + AppLocalizations.of(context)!.shots),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'Ok'),
                                  child: const Text('Ok'),
                                )
                              ],
                              elevation: 24.0,
                              backgroundColor: Colors.grey[300],
                              shape: CircleBorder(),
                            );
                            shotCounter=0;
                            print(shotCounter);
                            indexer++;}
                        }else{
                          shotCounter++;
                          print(shotCounter);
                        }

                      },
                      horizontalSwipeThreshold: 0.8,
                      verticalSwipeThreshold: 0.8,
                      builder: (context, properties) {
                        final itemIndex = properties.index % _images.length;

                        return Container(
                          margin: const EdgeInsets.symmetric(vertical:80.0, horizontal: 5.0),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ExampleCard(
                                name: '',//'Sample No.${itemIndex + 1}',
                                //assetPath: _images[itemIndex],
                                assetPath: _images[lista[itemIndex]],
                              ),
                              // more custom overlay possible than with overlayBuilder
                              if (properties.stackIndex == 0 &&
                                  properties.direction != null)
                                CardOverlay(
                                  swipeProgress: properties.swipeProgress,
                                  direction: properties.direction!,
                                )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0)

          // Stack(
          //   children: [
          //     Container(
          //       color: null,
          //       child: GestureDetector(
          //         behavior: HitTestBehavior.translucent,
          //         onTap: _flip,
          //         child: TweenAnimationBuilder(
          //             tween: Tween<double>(begin: 0, end: angle),
          //             duration: Duration(seconds: 1),
          //             builder: (BuildContext context, double val, __) {
          //               //here we will change the isBack val so we can change the content of the card
          //               if (val >= (pi / 2)) {
          //                 isBack = false;
          //               } else {
          //                 isBack = true;
          //               }
          //               return (Transform(
          //                 //let's make the card flip by it's center
          //                 alignment: Alignment.center,
          //                 transform: Matrix4.identity()
          //                   ..setEntry(3, 2, 0.001)
          //                   ..rotateY(val),
          //                 child: Container(
          //                     width: 309,
          //                     height: 474,
          //                     child: isBack
          //                         ? Container(
          //                             decoration: BoxDecoration(
          //                               borderRadius:
          //                                   BorderRadius.circular(10.0),
          //                               image: DecorationImage(
          //                                 image: AssetImage(
          //                                     "card_images/back_001.png"),
          //                               ),
          //                             ),
          //                           ) //if it's back we will display here
          //                         : Transform(
          //                             alignment: Alignment.center,
          //                             transform: Matrix4.identity()
          //                               ..rotateY(
          //                                   pi), // it will flip horizontally the container
          //                             child: Container(
          //                               decoration: BoxDecoration(
          //                                 borderRadius:
          //                                     BorderRadius.circular(10.0),
          //                                 image: DecorationImage(
          //                                   image: AssetImage(
          //                                       "card_images/face.png"),
          //                                 ),
          //                               ),
          //                               child: Center(
          //                                 child: Text(
          //                                   "Surprise1 ! 🎊",
          //                                   style: TextStyle(
          //                                     fontSize: 30.0,
          //                                     color: Colors.black87,
          //                                   ),
          //                                 ),
          //                               ),
          //                             ),
          //                           ) //else we will display it here,
          //                     ),
          //               ));
          //             }),
          //       ),
          //     ),
          //     Container(
          //       color: null,
          //       child: GestureDetector(
          //         behavior: HitTestBehavior.translucent,
          //         onTap: _flip,
          //         child: TweenAnimationBuilder(
          //             tween: Tween<double>(begin: 0, end: angle),
          //             duration: Duration(seconds: 1),
          //             builder: (BuildContext context, double val, __) {
          //               //here we will change the isBack val so we can change the content of the card
          //               if (val >= (pi / 2)) {
          //                 isBack = false;
          //               } else {
          //                 isBack = true;
          //               }
          //               return (Transform(
          //                 //let's make the card flip by it's center
          //                 alignment: Alignment.center,
          //                 transform: Matrix4.identity()
          //                   ..setEntry(3, 2, 0.001)
          //                   ..rotateY(val),
          //                 child: Container(
          //                     width: 309,
          //                     height: 474,
          //                     child: isBack
          //                         ? Container(
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(10.0),
          //                         image: DecorationImage(
          //                           image: AssetImage("card_images/back_001.png"),
          //                         ),
          //                       ),
          //                     ) //if it's back we will display here
          //                         : Transform(
          //                       alignment: Alignment.center,
          //                       transform: Matrix4.identity()
          //                         ..rotateY(
          //                             pi), // it will flip horizontally the container
          //                       child: Container(
          //                         decoration: BoxDecoration(
          //                           borderRadius:
          //                           BorderRadius.circular(10.0),
          //                           image: DecorationImage(
          //                             image: AssetImage("card_images/face.png"),
          //                           ),
          //                         ),
          //                         child: Center(
          //                           child: Text(
          //                             "Surprise2 ! 🎊",
          //                             style: TextStyle(
          //                               fontSize: 30.0,
          //                               color: Colors.black87,
          //                             ),
          //                           ),
          //                         ),
          //                       ),
          //                     ) //else we will display it here,
          //                 ),
          //               ));
          //             }),
          //       ),
          //     ),
          //   ],
          // )


        ],
      ),
    );
  }
}

//Λειτουργει
// Container(
// height: 150,
// child: SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row(
// children: deck.map((e) => PlayingCardView(card: e, style: CardMaker().myCardStyles)).toList(),
// ),
// ),
// ),
