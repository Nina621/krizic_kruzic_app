import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/constants/constants.dart';
import 'package:krizic_kruzic_app/model/enum/letter.dart';
import 'package:krizic_kruzic_app/model/game/tic_tac_toe_logic.dart';

TicTacToe game = TicTacToe();

class UILogic {
  static late Color xCardColor, oCardColor, oTextColor, xTextColor;
  static late List<String> chars;
  static String finalResult = "",
      character = "",
      ans = "",
      ansLetter = "",
      winningDirection = "";
  static late String side;
  static late List<bool> isSelected;
  static late bool letterX, letterO;
  static late double deviceW;
  static var containerWidth,
      bw,
      mat,
      deviceHeight,
      wpHeight,
      wpWidth,
      colorMap = {},
      playerMap = {};
  static bool muteSound = true;
  static String player1Name = "Player 1",
      player2Name = "Player 2",
      player1ImageName = "avatar-1",
      player2ImageName = "avatar-2";
  static int xWins = 0,
      oWins = 0,
      noOfWins = 2,
      noOfDraws = 2,
      draws = 0,
      maxWins = 25,
      maxDraws = 25;
  static int minWins = 1, minDraws = 1;
  static var avatar1Map = {
    'avatar-1': AppConstants.settingsBoxColor,
    'avatar-2': AppConstants.settingsBoxColor,
    'avatar-3': AppConstants.settingsBoxColor,
    'avatar-4': AppConstants.settingsBoxColor
  };
  static var avatar2Map = {
    'avatar-1': AppConstants.settingsBoxColor,
    'avatar-2': AppConstants.settingsBoxColor,
    'avatar-3': AppConstants.settingsBoxColor,
    'avatar-4': AppConstants.settingsBoxColor
  };

  void initializeColorMap() {
    for (int i = 0; i < 9; i++) {
      colorMap[i] = "kProfileContainerColor";
    }
  }

  void remainingVars() {
    finalResult = "";
    character = "";
    ans = "";
    ansLetter = "";
    winningDirection = "";
    isSelected = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    chars = ["", "", "", "", "", "", "", "", ""];
    mat = [
      ["", "", ""],
      ["", "", ""],
      ["", "", ""]
    ];
    colorMap = {};
  }

  void setWinningVariables() {
    xWins = 0;
    oWins = 0;
    draws = 0;
  }

  void setRemainingVarsColorMap() {
    remainingVars();
    initializeColorMap();
  }

  void setAllVars() {
    remainingVars();
    setWinningVariables();
    initializeColorMap();
  }

  void updateMatrix(int row, int col, String val) {
    if (mat[row][col] == "") game.insertIntoCell(row, col, val);
  }

  void setCardO() {
    oCardColor = AppConstants.profileContainerColor;
    oTextColor = AppConstants.letterXColor;
    xCardColor = AppConstants.gameScreenBackgroundColor;
    xTextColor = AppConstants.letterOColor;
  }

  void setCardX() {
    oCardColor = AppConstants.gameScreenBackgroundColor;
    oTextColor = AppConstants.letterOColor;
    xCardColor = AppConstants.profileContainerColor;
    xTextColor = AppConstants.letterXColor;
  }

  void updateColor(Letter selectedLetter) {
    if (selectedLetter == Letter.CARD_O) {
      if (oCardColor == AppConstants.gameScreenBackgroundColor &&
          oTextColor == AppConstants.letterOColor) setCardO();
    }
    if (selectedLetter == Letter.CARD_X) {
      if (xCardColor == AppConstants.gameScreenBackgroundColor &&
          xTextColor == AppConstants.letterOColor) setCardX();
    }
  }

  void startLetter(String c) {
    c == "X" ? letterO = false : letterO = true;
    letterX = !letterO;
    c == "X" ? playerMap['X'] = player1Name : playerMap['X'] = player2Name;
    c == "X" ? playerMap['O'] = player2Name : playerMap['O'] = player1Name;
  }

  void colorsAndSide() {
    xCardColor = AppConstants.profileContainerColor;
    oTextColor = AppConstants.letterOColor;
    oCardColor = AppConstants.gameScreenBackgroundColor;
    xTextColor = AppConstants.letterXColor;
    side = "X";
  }

  void playWinningSound() => AudioCache().play('winner.wav');

  void playDrawSound() => AudioCache().play('draw.mpeg');

  void playLetterSound() =>
      AudioCache().play(UILogic.character == "X" ? 'note1.wav' : 'note2.wav');

  void letterXTurn() {
    character = "X";
    letterX = false;
    letterO = true;
  }

  void letterOTurn() {
    character = "O";
    letterX = true;
    letterO = false;
  }

  void setRow1() => colorMap[0] = colorMap[3] = colorMap[6] = AppConstants.kG;

  void setRow2() => colorMap[1] = colorMap[4] = colorMap[7] = AppConstants.kG;

  void setRow3() => colorMap[2] = colorMap[5] = colorMap[8] = AppConstants.kG;

  void setCol1() => colorMap[0] = colorMap[1] = colorMap[2] = AppConstants.kG;

  void setCol2() => colorMap[3] = colorMap[4] = colorMap[5] = AppConstants.kG;

  void setCol3() => colorMap[6] = colorMap[7] = colorMap[8] = AppConstants.kG;

  void setLeftDiagnol() =>
      colorMap[0] = colorMap[4] = colorMap[8] = AppConstants.kG;

  void setRightDiagnol() =>
      colorMap[2] = colorMap[4] = colorMap[6] = AppConstants.kG;

  bool checkR1() =>
      mat[0][0] != "" && mat[0][0] == mat[0][1] && mat[0][1] == mat[0][2];

  bool checkR2() =>
      mat[1][0] != "" && mat[1][0] == mat[1][1] && mat[1][1] == mat[1][2];

  bool checkR3() =>
      mat[2][0] != "" && mat[2][0] == mat[2][1] && mat[2][1] == mat[2][2];

  bool checkC1() =>
      mat[0][0] != "" && mat[0][0] == mat[1][0] && mat[1][0] == mat[2][0];

  bool checkC2() =>
      mat[0][1] != "" && mat[0][1] == mat[1][1] && mat[1][1] == mat[2][1];

  bool checkC3() =>
      mat[0][2] != "" && mat[0][2] == mat[1][2] && mat[1][2] == mat[2][2];

  bool checkLeftDiagnol() => mat[0][0] == mat[1][1] && mat[1][1] == mat[2][2];

  bool checkRightDiagnol() => mat[2][0] == mat[1][1] && mat[1][1] == mat[0][2];
}
