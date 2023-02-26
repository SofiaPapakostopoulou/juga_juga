import 'dart:math';

import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:juga_juga/components/GameBrain.dart';
import 'package:juga_juga/components/Player.dart';
import 'package:juga_juga/screens/JJHomePage.dart';
import 'package:juga_juga/components/example_card.dart';
import 'package:juga_juga/components/card_overlay.dart';
import 'package:juga_juga/components/card_label.dart';
import 'package:juga_juga/theme/colors.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:juga_juga/components/CardMaker.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/scheduler.dart';
import'dart:io' show Platform;

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
const _back_image = 'playing_cards/card-back.png';

class JJGame extends StatefulWidget {
  final int numberOfPlayers;
  final int numberOfStacks;
  List<Player> PlayerList;
  JJGame(this.numberOfPlayers, this.numberOfStacks, this.PlayerList);

  // @override
  // _JJGameState createState() => _JJGameState();
  @override
  State<StatefulWidget> createState() {
    return new _JJGameState();
  }
}

class _JJGameState extends State<JJGame> {
  List<PlayingCard> deck = CardMaker().getCards();
  late List<int> lista = CardMaker().IndexMaker(widget.numberOfStacks);
  int indexer = 0;
  int shotCounter = 0;
  bool flag = false;
  int shot_count = 0;
  bool flagisimo = true;
  int man_index = 0;
  int end_shot = 0;

  late final SwipableStackController _controller;

  void _listenController() {
    setState(() {});
  }

  late final SwipableStackController controller;

  void _listenControllerr() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance?.addPostFrameCallback((_) {
      ShowAlert(AppLocalizations.of(context)!.swipe_guide);
    });

    _controller = SwipableStackController()..addListener(_listenController);
    controller = SwipableStackController()..addListener(_listenControllerr);
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_listenController)
      ..dispose();
    controller
      ..removeListener(_listenControllerr)
      ..dispose();
  }

  void ShowAlert(String text) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(text,
            style: TextStyle(fontFamily: 'Source Code Pro', fontSize: 20.0)),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              textStyle:
                  const TextStyle(fontFamily: 'Source Code Pro', fontSize: 20),
              backgroundColor: Colors.deepPurple[150],
            ),
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK', style: TextStyle(fontFamily: 'Source Code Pro', fontSize: 30)),
          ),
        ],
        elevation: 24.0,
        //backgroundColor: Colors.deepPurple[400],
          backgroundColor: Color(0xFF5F6A69),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 60.0),
          Text(widget.PlayerList[indexer].name + ',',
              style: TextStyle(fontFamily: 'Source Code Pro', fontSize: 40.0)),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.black + ", ",
                  style:
                      TextStyle(fontFamily: 'Source Code Pro', fontSize: 35.0)),
              Text(AppLocalizations.of(context)!.red + ",",
                  style:
                      TextStyle(fontFamily: 'Source Code Pro', fontSize: 35.0)),
              Text(AppLocalizations.of(context)!.or_orange,
                  style:
                      TextStyle(fontFamily: 'Source Code Pro', fontSize: 35.0)),
            ],
          ),

          SizedBox(height: 50),
          Expanded(
            child: Stack(
              children: [
                SwipableStack(
                  onWillMoveNext: (index, direction) {
                    final allowedActions = [
                      SwipeDirection.right,
                      SwipeDirection.left,
                    ];
                    final allowedActionsNon = [
                      SwipeDirection.up,
                    ];

                    if (flagisimo) {
                      return allowedActionsNon.contains(direction);
                    } else {
                      return allowedActions.contains(direction);
                    }
                  },
                  controller: _controller,
                  stackClipBehaviour: Clip.none,
                  onSwipeCompleted: (index, direction) {
                    print(lista[man_index]);

                    flagisimo = true;

                    if (direction == SwipeDirection.left) {
                      shot_count = shotCounter + 1;
                      print(flag);

                      String PlayerName =
                          widget.PlayerList[widget.numberOfPlayers - 1].name;
                      int Shots = shot_count;

                      List<String> alerts1 = [
                        PlayerName +
                            AppLocalizations.of(context)!.choose_player +
                            Shots.toString() +
                            " " +
                            AppLocalizations.of(context)!.shot_s,
                        PlayerName +
                            ", " +
                            AppLocalizations.of(context)!.youDrink +
                            " " +
                            Shots.toString() +
                            " " +
                            AppLocalizations.of(context)!.shot_s,
                      ];
                      List<String> alerts2 = [
                        PlayerName +
                            ", " +
                            AppLocalizations.of(context)!.youDrink +
                            " " +
                            (Shots ~/ 2).toString() +
                            " " +
                            AppLocalizations.of(context)!.shot_s +
                            AppLocalizations.of(context)!.player_right +
                            (Shots ~/ 2).toString() +
                            " " +
                            AppLocalizations.of(context)!.shot_s,
                        PlayerName +
                            ", " +
                            AppLocalizations.of(context)!.youDrink +
                            " " +
                            (Shots ~/ 2).toString() +
                            " " +
                            AppLocalizations.of(context)!.shot_s +
                            AppLocalizations.of(context)!.player_left +
                            (Shots ~/ 2).toString() +
                            " " +
                            AppLocalizations.of(context)!.shot_s,
                        PlayerName +
                            AppLocalizations.of(context)!.choose_player +
                            Shots.toString() +
                            " " +
                            AppLocalizations.of(context)!.shot_s,
                        PlayerName +
                            ", " +
                            AppLocalizations.of(context)!.youDrink +
                            " " +
                            Shots.toString() +
                            " " +
                            AppLocalizations.of(context)!.shot_s,
                        PlayerName +
                            AppLocalizations.of(context)!.share +
                            Shots.toString() +
                            " " +
                            AppLocalizations.of(context)!.shot_s +
                            AppLocalizations.of(context)!.share2
                      ];
                      List<String> alerts3 = [
                        PlayerName +
                            AppLocalizations.of(context)!.choose_player +
                            Shots.toString() +
                            " " +
                            AppLocalizations.of(context)!.shot_s,
                        PlayerName +
                            ", " +
                            AppLocalizations.of(context)!.youDrink +
                            " " +
                            Shots.toString() +
                            " " +
                            AppLocalizations.of(context)!.shot_s,
                        PlayerName +
                            AppLocalizations.of(context)!.share +
                            Shots.toString() +
                            " " +
                            AppLocalizations.of(context)!.shot_s +
                            AppLocalizations.of(context)!.share2
                      ];

                      if (flag) {
                        Random random = Random();
                        if (Shots == 1) {
                          int randomNumber = random.nextInt(2);
                          ShowAlert(alerts1[randomNumber]);
                        } else if (Shots > 1 && Shots % 2 == 0) {
                          int randomNumber = random.nextInt(5);
                          ShowAlert(alerts2[randomNumber]);
                        } else {
                          int randomNumber = random.nextInt(3);
                          ShowAlert(alerts3[randomNumber]);
                        }
                      } else {
                        Random random = Random();

                        PlayerName = widget.PlayerList[indexer].name;
                        //int Shots = shot_count;

                        List<String> alerts4 = [
                          PlayerName +
                              AppLocalizations.of(context)!.choose_player +
                              Shots.toString() +
                              " " +
                              AppLocalizations.of(context)!.shot_s,
                          PlayerName +
                              ", " +
                              AppLocalizations.of(context)!.youDrink +
                              " " +
                              Shots.toString() +
                              " " +
                              AppLocalizations.of(context)!.shot_s,
                        ];
                        List<String> alerts5 = [
                          PlayerName +
                              ", " +
                              AppLocalizations.of(context)!.youDrink +
                              " " +
                              (Shots ~/ 2).toString() +
                              " " +
                              AppLocalizations.of(context)!.shot_s +
                              AppLocalizations.of(context)!.player_right +
                              (Shots ~/ 2).toString() +
                              " " +
                              AppLocalizations.of(context)!.shot_s,
                          PlayerName +
                              ", " +
                              AppLocalizations.of(context)!.youDrink +
                              " " +
                              (Shots ~/ 2).toString() +
                              " " +
                              AppLocalizations.of(context)!.shot_s +
                              AppLocalizations.of(context)!.player_left +
                              (Shots ~/ 2).toString() +
                              " " +
                              AppLocalizations.of(context)!.shot_s,
                          PlayerName +
                              AppLocalizations.of(context)!.choose_player +
                              Shots.toString() +
                              " " +
                              AppLocalizations.of(context)!.shot_s,
                          PlayerName +
                              ", " +
                              AppLocalizations.of(context)!.youDrink +
                              " " +
                              Shots.toString() +
                              " " +
                              AppLocalizations.of(context)!.shot_s,
                          PlayerName +
                              AppLocalizations.of(context)!.share +
                              Shots.toString() +
                              " " +
                              AppLocalizations.of(context)!.shot_s +
                              AppLocalizations.of(context)!.share2
                        ];
                        List<String> alerts6 = [
                          PlayerName +
                              AppLocalizations.of(context)!.choose_player +
                              Shots.toString() +
                              " " +
                              AppLocalizations.of(context)!.shot_s,
                          PlayerName +
                              ", " +
                              AppLocalizations.of(context)!.youDrink +
                              " " +
                              Shots.toString() +
                              " " +
                              AppLocalizations.of(context)!.shot_s,
                          PlayerName +
                              AppLocalizations.of(context)!.share +
                              Shots.toString() +
                              " " +
                              AppLocalizations.of(context)!.shot_s +
                              AppLocalizations.of(context)!.share2
                        ];

                        String FinalAlert;
                        if (Shots == 1) {
                          int randomNumber = random.nextInt(2);
                          FinalAlert = alerts4[randomNumber];
                        } else if (Shots > 1 && Shots % 2 == 0) {
                          int randomNumber = random.nextInt(5);
                          FinalAlert = alerts5[randomNumber];
                        } else {
                          int randomNumber = random.nextInt(3);
                          FinalAlert = alerts6[randomNumber];
                        }

                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(FinalAlert,
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
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK',style: TextStyle(fontSize: 30)),
                              ),
                            ],
                            elevation: 24.0,
                            backgroundColor: Colors.deepPurple[400],
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))
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

                      end_shot = shotCounter;
                      shotCounter = 0;
                      print("man_index $man_index");
                    }
                    else if (direction == SwipeDirection.right) {
                      shotCounter++;
                      man_index++;
                    }
                    else if (direction == SwipeDirection.up) {
                      int cardA = lista[man_index];
                      int cardB = lista[man_index + 1];
                      showGeneralDialog(
                        context: context,
                        barrierColor: Colors.black38,
                        barrierLabel: 'Label',
                        barrierDismissible: false,
                        pageBuilder: (_, __, ___) => Center(
                          child: Container(
                            color: Colors.transparent,
                            child: Material(
                              color: Colors.transparent,
                              child: SizedBox(
                                height: 300,
                                width: 300,
                                child: SwipableStack(
                                  detectableSwipeDirections: const {
                                    SwipeDirection.right,
                                    SwipeDirection.left,
                                  },
                                  controller: controller,
                                  stackClipBehaviour: Clip.none,
                                  onSwipeCompleted: (indexx, directionn) {
                                    flagisimo = true;
                                    if (directionn == SwipeDirection.left) {
                                      shot_count = shotCounter + 2;
                                      //print(flag);

                                      String PlayerName = widget
                                          .PlayerList[
                                              widget.numberOfPlayers - 1]
                                          .name;
                                      int Shots = shot_count;

                                      List<String> alerts1 = [
                                        PlayerName +
                                            AppLocalizations.of(context)!
                                                .choose_player +
                                            Shots.toString() +
                                            " " +
                                            AppLocalizations.of(context)!
                                                .shot_s,
                                        PlayerName +
                                            ", " +
                                            AppLocalizations.of(context)!
                                                .youDrink +
                                            " " +
                                            Shots.toString() +
                                            " " +
                                            AppLocalizations.of(context)!
                                                .shot_s,
                                      ];
                                      List<String> alerts2 = [
                                        PlayerName +
                                            ", " +
                                            AppLocalizations.of(context)!
                                                .youDrink +
                                            " " +
                                            (Shots ~/ 2).toString() +
                                            " " +
                                            AppLocalizations.of(context)!
                                                .shot_s +
                                            AppLocalizations.of(context)!
                                                .player_right +
                                            (Shots ~/ 2).toString() +
                                            " " +
                                            AppLocalizations.of(context)!
                                                .shot_s,
                                        PlayerName +
                                            ", " +
                                            AppLocalizations.of(context)!
                                                .youDrink +
                                            " " +
                                            (Shots ~/ 2).toString() +
                                            " " +
                                            AppLocalizations.of(context)!
                                                .shot_s +
                                            AppLocalizations.of(context)!
                                                .player_left +
                                            (Shots ~/ 2).toString() +
                                            " " +
                                            AppLocalizations.of(context)!
                                                .shot_s,
                                        PlayerName +
                                            AppLocalizations.of(context)!
                                                .choose_player +
                                            Shots.toString() +
                                            " " +
                                            AppLocalizations.of(context)!
                                                .shot_s,
                                        PlayerName +
                                            ", " +
                                            AppLocalizations.of(context)!
                                                .youDrink +
                                            " " +
                                            Shots.toString() +
                                            " " +
                                            AppLocalizations.of(context)!
                                                .shot_s,
                                        PlayerName +
                                            AppLocalizations.of(context)!
                                                .share +
                                            Shots.toString() +
                                            " " +
                                            AppLocalizations.of(context)!
                                                .shot_s +
                                            AppLocalizations.of(context)!.share2
                                      ];
                                      List<String> alerts3 = [
                                        PlayerName +
                                            AppLocalizations.of(context)!
                                                .choose_player +
                                            Shots.toString() +
                                            " " +
                                            AppLocalizations.of(context)!
                                                .shot_s,
                                        PlayerName +
                                            ", " +
                                            AppLocalizations.of(context)!
                                                .youDrink +
                                            " " +
                                            Shots.toString() +
                                            " " +
                                            AppLocalizations.of(context)!
                                                .shot_s,
                                        PlayerName +
                                            AppLocalizations.of(context)!
                                                .share +
                                            Shots.toString() +
                                            " " +
                                            AppLocalizations.of(context)!
                                                .shot_s +
                                            AppLocalizations.of(context)!.share2
                                      ];

                                      Navigator.pop(context);

                                      if (flag) {
                                        Random random = Random();
                                        if (Shots == 1) {
                                          int randomNumber = random.nextInt(2);
                                          ShowAlert(alerts1[randomNumber]);
                                        } else if (Shots > 1 &&
                                            Shots % 2 == 0) {
                                          int randomNumber = random.nextInt(5);
                                          ShowAlert(alerts2[randomNumber]);
                                        } else {
                                          int randomNumber = random.nextInt(3);
                                          ShowAlert(alerts3[randomNumber]);
                                        }
                                      } else {
                                        Random random = Random();

                                        PlayerName =
                                            widget.PlayerList[indexer].name;
                                        //int Shots = shot_count;

                                        List<String> alerts4 = [
                                          PlayerName +
                                              AppLocalizations.of(context)!
                                                  .choose_player +
                                              Shots.toString() +
                                              " " +
                                              AppLocalizations.of(context)!
                                                  .shot_s,
                                          PlayerName +
                                              ", " +
                                              AppLocalizations.of(context)!
                                                  .youDrink +
                                              " " +
                                              Shots.toString() +
                                              " " +
                                              AppLocalizations.of(context)!
                                                  .shot_s,
                                        ];
                                        List<String> alerts5 = [
                                          PlayerName +
                                              ", " +
                                              AppLocalizations.of(context)!
                                                  .youDrink +
                                              " " +
                                              (Shots ~/ 2).toString() +
                                              " " +
                                              AppLocalizations.of(context)!
                                                  .shot_s +
                                              AppLocalizations.of(context)!
                                                  .player_right +
                                              (Shots ~/ 2).toString() +
                                              " " +
                                              AppLocalizations.of(context)!
                                                  .shot_s,
                                          PlayerName +
                                              ", " +
                                              AppLocalizations.of(context)!
                                                  .youDrink +
                                              " " +
                                              (Shots ~/ 2).toString() +
                                              " " +
                                              AppLocalizations.of(context)!
                                                  .shot_s +
                                              AppLocalizations.of(context)!
                                                  .player_left +
                                              (Shots ~/ 2).toString() +
                                              " " +
                                              AppLocalizations.of(context)!
                                                  .shot_s,
                                          PlayerName +
                                              AppLocalizations.of(context)!
                                                  .choose_player +
                                              Shots.toString() +
                                              " " +
                                              AppLocalizations.of(context)!
                                                  .shot_s,
                                          PlayerName +
                                              ", " +
                                              AppLocalizations.of(context)!
                                                  .youDrink +
                                              " " +
                                              Shots.toString() +
                                              " " +
                                              AppLocalizations.of(context)!
                                                  .shot_s,
                                          PlayerName +
                                              AppLocalizations.of(context)!
                                                  .share +
                                              Shots.toString() +
                                              " " +
                                              AppLocalizations.of(context)!
                                                  .shot_s +
                                              AppLocalizations.of(context)!
                                                  .share2
                                        ];
                                        List<String> alerts6 = [
                                          PlayerName +
                                              AppLocalizations.of(context)!
                                                  .choose_player +
                                              Shots.toString() +
                                              " " +
                                              AppLocalizations.of(context)!
                                                  .shot_s,
                                          PlayerName +
                                              ", " +
                                              AppLocalizations.of(context)!
                                                  .youDrink +
                                              " " +
                                              Shots.toString() +
                                              " " +
                                              AppLocalizations.of(context)!
                                                  .shot_s,
                                          PlayerName +
                                              AppLocalizations.of(context)!
                                                  .share +
                                              Shots.toString() +
                                              " " +
                                              AppLocalizations.of(context)!
                                                  .shot_s +
                                              AppLocalizations.of(context)!
                                                  .share2
                                        ];

                                        String FinalAlert;
                                        if (Shots == 1) {
                                          int randomNumber = random.nextInt(2);
                                          FinalAlert = alerts4[randomNumber];
                                        } else if (Shots > 1 &&
                                            Shots % 2 == 0) {
                                          int randomNumber = random.nextInt(5);
                                          FinalAlert = alerts5[randomNumber];
                                        } else {
                                          int randomNumber = random.nextInt(3);
                                          FinalAlert = alerts6[randomNumber];
                                        }

                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: Text(FinalAlert,
                                                style: TextStyle(
                                                    fontFamily:
                                                        'Source Code Pro',
                                                    fontSize: 20.0)),
                                            actions: <Widget>[
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  primary: Colors.white,
                                                  textStyle: const TextStyle(
                                                      fontFamily:
                                                          'Source Code Pro',
                                                      fontSize: 20),
                                                  backgroundColor:
                                                      Colors.deepPurple[150],
                                                ),
                                                onPressed: () => Navigator.pop(
                                                    context, 'OK'),
                                                child: const Text('OK'),
                                              ),
                                            ],
                                            elevation: 24.0,
                                            backgroundColor:
                                                Colors.deepPurple[400],
                                          ),
                                        );
                                      }

                                      if (indexer >= 0 &&
                                          indexer <
                                              widget.numberOfPlayers - 1) {
                                        indexer++;
                                        flag = false;
                                        if (indexer ==
                                            widget.numberOfPlayers - 1) {
                                          flag = true;
                                        }
                                      } else {
                                        flag = false;
                                        indexer = 0;
                                      }
                                      shotCounter = 0;
                                      man_index++;
                                      //SwipableStackController().currentIndex= index+2;
                                      //indexx = indexx+2;
                                      print("μαν_index $man_index");
                                    }
                                    else if(directionn == SwipeDirection.right){
                                      shotCounter = shotCounter + 2;
                                      man_index = man_index+2;
                                      print(shotCounter);
                                      Navigator.pop(context);
                                    }
                                  },
                                  horizontalSwipeThreshold: 0.8,
                                  verticalSwipeThreshold: 0.8,
                                  builder: (context, properties) {
                                    //final itemIndexx = properties.index % _images.length;

                                    return Stack(
                                      alignment: Alignment.center,
                                      fit: StackFit.loose,
                                      children: <Widget>[
                                        Positioned(
                                            left: -1,
                                            child: Image(
                                                height: 300,
                                                //width: 500,
                                                image: AssetImage(
                                                    _images[cardA]))),
                                        Positioned(
                                            right: -1,
                                            child: Image(
                                                height: 300,
                                                //width: 500,
                                                image: AssetImage(
                                                    _images[cardB]))),
                                      ],
                                      overflow: Overflow.visible,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                    String PlayerName =
                        widget.PlayerList[widget.numberOfPlayers - 1].name;
                    int Shots = end_shot;
                    man_index++;

                    if (man_index >= (widget.numberOfStacks) * 10) { //51
                      if (Shots > 0) {
                        showDialog<String>(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(
                                AppLocalizations.of(context)!.final_alert1 +
                                    PlayerName +
                                    AppLocalizations.of(context)!.share +
                                    Shots.toString() +
                                    " " +
                                    AppLocalizations.of(context)!.shot_s +
                                    AppLocalizations.of(context)!.share2 +
                                    AppLocalizations.of(context)!.final_alert2,
                                style: TextStyle(
                                    fontFamily: 'Source Code Pro',
                                    fontSize: 20.0)),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => new JJGame(
                                            widget.numberOfPlayers,
                                            widget.numberOfStacks,
                                            widget.PlayerList))),
                                child: Text(AppLocalizations.of(context)!.yes,
                                    style: TextStyle(
                                        fontFamily: 'Source Code Pro',
                                        fontSize: 20.0,
                                        color: Colors.white)),
                              ),
                              TextButton(
                                onPressed: () => {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: Text(
                                              AppLocalizations.of(context)!
                                                  .sure,
                                              style: TextStyle(
                                                  fontFamily: 'Source Code Pro',
                                                  fontSize: 20.0)),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => {
                                                if(Platform.isAndroid){
                                                  SystemNavigator.pop()
                                                }
                                              },
                                              child: Text(
                                                  AppLocalizations.of(context)!
                                                      .yes),
                                            ),

                                          ],
                                          elevation: 24.0,
                                          backgroundColor: Colors.deepPurple[400],
                                        ),
                                  )
                                },
                                child: Text(AppLocalizations.of(context)!.no,
                                    style: TextStyle(
                                        fontFamily: 'Source Code Pro',
                                        fontSize: 20.0,
                                        color: Colors.white)),
                              ),
                            ],
                            elevation: 24.0,
                            backgroundColor: Colors.deepPurple[400],
                          ),
                        );
                      } else if (Shots == 0) {
                        showDialog<String>(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(
                                AppLocalizations.of(context)!.final_alert1 +
                                    AppLocalizations.of(context)!.final_alert2,
                                style: TextStyle(
                                    fontFamily: 'Source Code Pro',
                                    fontSize: 20.0)),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => new JJGame(
                                            widget.numberOfPlayers,
                                            widget.numberOfStacks,
                                            widget.PlayerList))),
                                child: Text(AppLocalizations.of(context)!.yes,
                                    style: TextStyle(
                                        fontFamily: 'Source Code Pro',
                                        fontSize: 25.0,
                                    color: Colors.white)),
                              ),
                              TextButton(
                                onPressed: () => {
                                  showDialog<String>(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: Text(
                                          AppLocalizations.of(context)!
                                                  .sure,
                                          style: TextStyle(
                                              fontFamily: 'Source Code Pro',
                                              fontSize: 20.0)),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            if(Platform.isAndroid){
                                              SystemNavigator.pop()
                                            }
                                          },
                                          child: Text(
                                              AppLocalizations.of(context)!
                                                  .yes,
                                              style: TextStyle(
                                                  fontFamily: 'Source Code Pro',
                                                  fontSize: 25.0,
                                                  color: Colors.white)),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) => new JJGame(
                                                      widget.numberOfPlayers,
                                                      widget.numberOfStacks,
                                                      widget.PlayerList))),
                                          child: Text(
                                              AppLocalizations.of(context)!
                                                  .no,
                                              style: TextStyle(
                                                  fontFamily: 'Source Code Pro',
                                                  fontSize: 25.0,
                                                  color: Colors.white)),
                                        ),

                                      ],
                                      elevation: 24.0,
                                      backgroundColor: Colors.deepPurple[400],
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))
                                    ),
                                  )
                                },
                                child: Text(AppLocalizations.of(context)!.no,
                                    style: TextStyle(
                                        fontFamily: 'Source Code Pro',
                                        fontSize: 25.0,
                                        color: Colors.white)),
                              ),
                            ],
                            elevation: 24.0,
                            backgroundColor: Colors.deepPurple[400],
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))
                          ),
                        );
                      }
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

                      back: Container(
                        //front
                        margin: new EdgeInsets.symmetric(horizontal: 20.0),
                        width: 350,
                        height: 500,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ExampleCard(
                              name: '',
                              //assetPath: _images[lista[itemIndex]],
                              assetPath: _images[lista[man_index]],
                            ),
                          ],
                        ),
                      ),

                      front: Container(
                        //back
                        margin: new EdgeInsets.symmetric(horizontal: 20.0),
                        width: 350,
                        height: 500,
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
