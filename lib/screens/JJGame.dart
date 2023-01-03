import 'dart:ffi';

import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:juga_juga/components/GameBrain.dart';
import 'package:juga_juga/components/Player.dart';
import 'package:juga_juga/components/example_card.dart';
import 'package:juga_juga/components/card_overlay.dart';
import 'package:juga_juga/components/card_label.dart';
import 'package:juga_juga/components/bottom_buttons_row.dart';
import 'package:juga_juga/theme/colors.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:juga_juga/components/CardMaker.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/scheduler.dart';
import 'package:swipe_deck/swipe_deck.dart';
const IMAGES = ["2_of_clubs", "3_of_clubs"];

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
const _back_image = 'playing_cards/back_card.png';

class JJGame extends StatefulWidget {
  final int numberOfPlayers;
  final int numberOfStacks;
  List<Player> PlayerList;
  JJGame(this.numberOfPlayers, this.numberOfStacks, this.PlayerList);
  //JJGame(this.numberOfPlayers,this.numberOfStacks, {required Key key}): super(key: key);

  // @override
  // _JJGameState createState() => _JJGameState();
  @override
  State<StatefulWidget> createState() {
    return new _JJGameState();
  }
}

class _JJGameState extends State<JJGame> {
  List<PlayingCard> deck = CardMaker().getCards();
  List<int> lista = CardMaker().IndexMaker();
  //List<int> listaHalf = CardMaker().IndexMaker();
  int indexer = 0;
  int shotCounter = 0;
  bool flag = false;
  int shot_count = 0;
  bool flagisimo = true;


  late final SwipableStackController _controller;

  void _listenController() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance?.addPostFrameCallback((_) {
      ShowAlert(AppLocalizations.of(context)!.swipe_guide);
    });

    _controller = SwipableStackController()..addListener(_listenController);
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_listenController)
      ..dispose();
  }

  void ShowAlert(String text) {
    //alert για οταν ανοιγει το screen
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(text,
            style:
                TextStyle(fontFamily: 'Source Code Pro', fontSize: 20.0)),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              textStyle: const TextStyle(
                  fontFamily: 'Source Code Pro', fontSize: 20),
              backgroundColor: Colors.deepPurple[150],
            ),
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
        elevation: 24.0,
        backgroundColor: Colors.deepPurple[400],
      ),
    );
  }

  void ShowAlert1(String player, int counter){
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
      title: Text(player + ", " + AppLocalizations.of(context)!.share+
          counter.toString() + AppLocalizations.of(context)!.share2,
          style:
          TextStyle(fontFamily: 'Source Code Pro', fontSize: 20.0)),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.white,
            textStyle: const TextStyle(
                fontFamily: 'Source Code Pro', fontSize: 20),
            backgroundColor: Colors.deepPurple[150],
          ),
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
      elevation: 24.0,
      backgroundColor: Colors.deepPurple[400],
    ),);
  }

  void ShowAlert2(String player, int counter){
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(player + "," + AppLocalizations.of(context)!.youDrink +
            (counter/2).toString() +AppLocalizations.of(context)!.shots + "and the player to your right drinks " + (counter/2).toString() + "shot/shots",
            style:
            TextStyle(fontFamily: 'Source Code Pro', fontSize: 20.0)),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              textStyle: const TextStyle(
                  fontFamily: 'Source Code Pro', fontSize: 20),
              backgroundColor: Colors.deepPurple[150],
            ),
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
        elevation: 24.0,
        backgroundColor: Colors.deepPurple[400],
      ),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 60.0),
          Text(widget.PlayerList[indexer].name + ',',
              style: TextStyle(
                  fontFamily: 'Source Code Pro', fontSize: 35.0)),

          // Text(AppLocalizations.of(context)!.playerChoose,
          //     style: TextStyle(
          //         fontFamily: 'Fredericka the Great', fontSize: 30.0)),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(
                      fontFamily: 'Source Code Pro', fontSize: 30),
                  backgroundColor: Colors.deepPurple[150],
                ),
                onPressed: () => setState(() {FlipCardState().isFront;}),
                child: Text(AppLocalizations.of(context)!.black + ","),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(
                      fontFamily: 'Source Code Pro', fontSize: 30),
                  backgroundColor: Colors.deepPurple[150],
                ),
                onPressed: () => Navigator.pop(context, 'OK'),
                child: Text(AppLocalizations.of(context)!.red + ","),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(
                      fontFamily: 'Source Code Pro', fontSize: 30),
                  backgroundColor: Colors.deepPurple[150],
                ),
                onPressed: () => setState(() {
                  int cardA = lista[indexer];
                  int cardB = lista[indexer + 1];
                  showGeneralDialog(
                    context: context,
                    barrierColor: Colors.black38,
                    barrierLabel: 'Label',
                    barrierDismissible: true,
                    pageBuilder: (_, __, ___) => Center(
                      child: Container(
                        color: Colors.transparent,
                        child: Material(
                          color: Colors.transparent,
                          child: SizedBox(
                            height: 300,
                            width: 300,
                            child: Stack(
                              alignment: Alignment.center,
                              fit: StackFit.loose,
                              children: <Widget>[
                                Positioned(
                                    left: -1,
                                    child: Image(
                                        height: 300,
                                        //width: 500,
                                        image: AssetImage(_images[cardA]))),
                                Positioned(
                                    right: -1,
                                    child: Image(
                                        height: 300,
                                        //width: 500,
                                        image: AssetImage(_images[cardB]))),
                              ],
                              overflow: Overflow.visible,
                            ),),
                      ),
                    ),
                  ),);
                }),
                child: Text(AppLocalizations.of(context)!.or_orange),
              ),
            ],
          ),

          SizedBox(height: 40),
          Expanded(
            child: Stack(
               children: [
                    SwipableStack(
                      // detectableSwipeDirections: {
                      //   SwipeDirection.right,
                      //   SwipeDirection.left,
                      // },
                      onWillMoveNext: (index, direction) {
                        final List<String> ShotList1 = [
                          AppLocalizations.of(context)!.shot_four,
                          AppLocalizations.of(context)!.shot_five];
                        final List<String> ShotList2 = [
                          AppLocalizations.of(context)!.shot_one,
                          AppLocalizations.of(context)!.shot_two,
                          AppLocalizations.of(context)!.shot_three,
                          AppLocalizations.of(context)!.shot_four,
                          AppLocalizations.of(context)!.shot_five];
                        final List<String> ShotList3 = [
                          AppLocalizations.of(context)!.shot_one,
                          AppLocalizations.of(context)!.shot_four,
                          AppLocalizations.of(context)!.shot_five];

                        final allowedActions = [
                          SwipeDirection.right,
                          SwipeDirection.left,
                        ];
                        final allowedActionsNon = [];

                        if (flagisimo) {
                          return allowedActionsNon.contains(direction);
                        } else {
                          return allowedActions.contains(direction);
                        }
                      },

                      controller: _controller,
                      stackClipBehaviour: Clip.none,
                      onSwipeCompleted: (index, direction) {
                        flagisimo = true;
                        if (direction == SwipeDirection.left) {
                          shot_count = shotCounter + 1;
                          if (flag) {
                            // ShowAlert(widget
                            //         .PlayerList[widget.numberOfPlayers - 1]
                            //         .name +
                            //     ", " +
                            //     AppLocalizations.of(context)!.youDrink +
                            //     " " +
                            //     (shot_count).toString() +
                            //     " " +
                            //     AppLocalizations.of(context)!.shots);

                            ShowAlert1(widget.PlayerList[widget.numberOfPlayers - 1].name,shot_count);
                          } else {
                            // List<String> tester = [
                            //   widget.PlayerList[indexer - 1].name + ", " +
                            //       AppLocalizations.of(context)!.youDrink + " " +
                            //       (shot_count).toString() + " " +
                            //       AppLocalizations.of(context)!.shots];
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text(
                                    widget.PlayerList[indexer - 1].name +
                                        ", " +
                                        AppLocalizations.of(context)!.youDrink +
                                        " " +
                                        (shot_count).toString() +
                                        " " +
                                         AppLocalizations.of(context)!.shots,

                                    style: TextStyle(
                                        fontFamily: 'Source Code Pro',
                                        fontSize: 20.0)),
                                actions: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      textStyle: const TextStyle(
                                          fontFamily: 'Source Code Pro',
                                          fontSize: 20),
                                      backgroundColor: Colors.deepPurple[150],
                                    ),
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                                elevation: 24.0,
                                backgroundColor: Colors.deepPurple[400],
                              ),
                            );
                          }


                          if (indexer >= 0 &&
                              indexer < widget.numberOfPlayers - 1) {
                            indexer++;
                            flag = false;
                            if (indexer == widget.numberOfPlayers - 1) {
                              flag = true;
                            }
                          } else {
                            flag = false;
                            indexer = 0;
                          }
                          shotCounter = 0;
                        } else if (direction == SwipeDirection.right) {
                          shotCounter++;
                        }
                      },
                      horizontalSwipeThreshold: 0.8,
                      verticalSwipeThreshold: 0.8,
                      builder: (context, properties) {
                        final itemIndex = properties.index % _images.length;

                        return FlipCard(
                          fill: Fill
                              .fillBack, // Fill the back side of the card to make in the same size as the front.
                          direction: FlipDirection.HORIZONTAL,
                          onFlipDone: (status) {
                            if (status) {
                              flagisimo = false;
                            } else {
                              flagisimo = true;
                            }
                          },

                          back: Container( //front
                            //alignment: Alignment.center,
                            margin: new EdgeInsets.symmetric(horizontal: 20.0),
                            width: 350,
                            height: 500,
                            // margin: const EdgeInsets.symmetric(
                            //     vertical: 30.0, horizontal: 10.0),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                ExampleCard(
                                  name: '',
                                  assetPath: _images[lista[itemIndex]],
                                ),
                              ],
                            ),
                          ),

                          front: Container( //back
                            //alignment: Alignment.center,
                            margin: new EdgeInsets.symmetric(horizontal: 20.0),
                            width: 350,
                            height: 500,
                            // margin: const EdgeInsets.symmetric(
                            //     vertical: 50.0, horizontal: 25.0),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                ExampleCard(
                                  name: '', //'Sample No.${itemIndex + 1}',
                                  assetPath: _back_image,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  //),
                //),
              ],
            ),
          ),
          //SizedBox(height: 5.0)
        ],
      ),
    );
  }
}
