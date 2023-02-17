import 'dart:async';

import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/constants/constants.dart';
import 'package:krizic_kruzic_app/model/game/tic_tac_toe_logic.dart';
import 'package:krizic_kruzic_app/model/game/ui_logic.dart';
import 'package:krizic_kruzic_app/screens/games/result_screen.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';
import 'package:krizic_kruzic_app/widgets/profileContainerRow.dart';
import 'package:krizic_kruzic_app/widgets/wrapping_container.dart';

UILogic ui = UILogic();
TicTacToe game = TicTacToe();

class GameScreen extends StatefulWidget {
  String chosenLetter;

  GameScreen({
    super.key,
    required this.chosenLetter,
  });

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    widget.chosenLetter == "O" ? ui.startLetter("O") : ui.startLetter("X");
    ui.initializeColorMap();
    startTimer();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
  }

  static const maxSeconds = 15;
  int seconds = maxSeconds;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        setState(() {
          UILogic.letterO = !UILogic.letterO;
          UILogic.letterX = !UILogic.letterX;
        });
        stopTimer();
      }
    });
  }

  void resetTimer() => setState(() => seconds = maxSeconds);

  void stopTimer({bool reset = true, bool start = true}) {
    if (reset) {
      resetTimer();
    }
    timer?.cancel();
    if (start) startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void checkRows() {
      setState(() {
        if (ui.checkR1()) ui.setRow1();
        if (ui.checkR2()) ui.setRow2();
        if (ui.checkR3()) ui.setRow3();
      });
    }

    void checkColumns() {
      setState(() {
        if (ui.checkC1()) ui.setCol1();
        if (ui.checkC2()) ui.setCol2();
        if (ui.checkC3()) ui.setCol3();
      });
    }

    void checkLeftDiagonal() {
      setState(() {
        if (ui.checkLeftDiagnol()) ui.setLeftDiagnol();
      });
    }

    void checkRightDiagonal() {
      setState(() {
        if (ui.checkRightDiagnol()) ui.setRightDiagnol();
      });
    }

    void navigateToResultScreen() {
      Future.delayed(const Duration(milliseconds: 1000), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              winningLetter: UILogic.ansLetter,
              onTap: () {
                ui.setAllVars();
                stopTimer();
                Navigator.pop(context);
              },
            ),
          ),
        ).then((value) => setState(() {})); // Force reload the page
      });
    }

    void changeWinningLetterColors(String ansLetter) {
      UILogic.winningDirection == "checkRows"
          ? checkRows()
          : UILogic.winningDirection == "checkColumns"
              ? checkColumns()
              : UILogic.winningDirection == "checkLeftDiagonal"
                  ? checkLeftDiagonal()
                  : checkRightDiagonal();

      if (ansLetter == "X") {
        UILogic.xWins++;
        if (UILogic.xWins == UILogic.noOfWins) {
          stopTimer(start: false);
          navigateToResultScreen();
        } else {
          Future.delayed(const Duration(milliseconds: 1000), () {
            ui.setRemainingVarsColorMap();
          });
          setState(() => UILogic.letterO = true);
          stopTimer();
        }
      } else if (ansLetter == "O") {
        UILogic.oWins++;
        if (UILogic.oWins == UILogic.noOfWins) {
          stopTimer(start: false);
          navigateToResultScreen();
        } else {
          Future.delayed(const Duration(milliseconds: 1000), () {
            ui.setRemainingVarsColorMap();
          });
          setState(() => UILogic.letterX = true);
          stopTimer();
        }
      }
    }

    void fun(int r, int c, int containerNo) {
      if (UILogic.finalResult == "") {
        UILogic.isSelected[containerNo] = true;

        if (UILogic.letterX && UILogic.mat[r][c] == "") {
          ui.letterXTurn();
        } else if (UILogic.letterO && UILogic.mat[r][c] == "") {
          ui.letterOTurn();
        }
        if (UILogic.chars[containerNo] == "") {
          setState(() {
            UILogic.chars[containerNo] = UILogic.character;
            stopTimer();
          });
        }
        ui.updateMatrix(r, c, UILogic.character);
        if (game.checkWinningCondition() == "Win") {
          UILogic.finalResult = "Win";
          if (UILogic.muteSound == false) {
            ui.playWinningSound();
          }
          changeWinningLetterColors(UILogic.ansLetter);
        } else if (game.checkDrawCondition() == "Draw") {
          UILogic.draws++;
          if (UILogic.muteSound == false) {
            ui.playDrawSound();
          }
          UILogic.finalResult = "Draw";
          if (UILogic.draws == UILogic.noOfDraws) {
            stopTimer();
            navigateToResultScreen();
          } else {
            Future.delayed(const Duration(milliseconds: 1000), () {
              UILogic.ansLetter == "X"
                  ? setState(() => UILogic.letterO = true)
                  : setState(() => UILogic.letterX = true);
              ui.setRemainingVarsColorMap();
              stopTimer();
            });
          }
        }
        if (UILogic.muteSound == false) ui.playLetterSound();
      }
    }

    UILogic.deviceW = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primaryMainColor,
      body: SafeArea(
        child: ScaleTransition(
          scale: animation,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 25),
                child: Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    height: Dimensions.height40,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: seconds / maxSeconds,
                          valueColor: const AlwaysStoppedAnimation(
                            AppColors.profileContainerColor,
                          ),
                          backgroundColor: Colors.white,
                        ),
                        Text(
                          '$seconds',
                          style: AppConstants.yourTurnText
                              .copyWith(fontSize: Dimensions.font20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: EntireRowInGameScreen(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                child: Container(
                  width: UILogic.deviceW - 40,
                  height: UILogic.deviceW - 40,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryMainColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Wrap(direction: Axis.vertical, children: [
                    WrappingContainer(
                      onTap: () {
                        fun(0, 0, 0);
                      },
                      letter: UILogic.isSelected[0] ? UILogic.character : "",
                      containerNo: 0,
                    ),
                    WrappingContainer(
                      onTap: () {
                        fun(1, 0, 1);
                      },
                      letter: UILogic.isSelected[1] ? UILogic.character : "",
                      containerNo: 1,
                    ),
                    WrappingContainer(
                      onTap: () {
                        fun(2, 0, 2);
                      },
                      letter: UILogic.isSelected[2] ? UILogic.character : "",
                      containerNo: 2,
                    ),
                    WrappingContainer(
                      onTap: () {
                        fun(0, 1, 3);
                      },
                      letter: UILogic.isSelected[3] ? UILogic.character : "",
                      containerNo: 3,
                    ),
                    WrappingContainer(
                      onTap: () {
                        fun(1, 1, 4);
                      },
                      letter: UILogic.isSelected[4] ? UILogic.character : "",
                      containerNo: 4,
                    ),
                    WrappingContainer(
                      onTap: () {
                        fun(2, 1, 5);
                      },
                      letter: UILogic.isSelected[5] ? UILogic.character : "",
                      containerNo: 5,
                    ),
                    WrappingContainer(
                      onTap: () {
                        fun(0, 2, 6);
                      },
                      letter: UILogic.isSelected[6] ? UILogic.character : "",
                      containerNo: 6,
                    ),
                    WrappingContainer(
                      onTap: () {
                        fun(1, 2, 7);
                      },
                      letter: UILogic.isSelected[7] ? UILogic.character : "",
                      containerNo: 7,
                    ),
                    WrappingContainer(
                      onTap: () {
                        fun(2, 2, 8);
                      },
                      letter: UILogic.isSelected[8] ? UILogic.character : "",
                      containerNo: 8,
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
