import 'ui_logic.dart';

class TicTacToe {
  void insertIntoCell(int rowIndex, int columnIndex, String val) {
    UILogic.mat[rowIndex][columnIndex] = val;
    UILogic.ansLetter = val;
  }

  String checkWinningCondition() {
    for (int i = 0; i < 3; i++) {
      if ((UILogic.mat[i][0] != "") &&
          (UILogic.mat[i][0] == UILogic.mat[i][1]) &&
          (UILogic.mat[i][1] == UILogic.mat[i][2])) {
        UILogic.ans = "Win";
        UILogic.winningDirection = "checkRows";
        break;
      }
    }

    for (int i = 0; i < 3; i++) {
      if ((UILogic.ans != "you win") &&
          (UILogic.mat[0][i] != "") &&
          (UILogic.mat[0][i] == UILogic.mat[1][i]) &&
          (UILogic.mat[1][i] == UILogic.mat[2][i])) {
        UILogic.ans = "Win";
        UILogic.winningDirection = "checkColumns";
        break;
      }
    }

    if ((UILogic.ans != "you win") &&
        (UILogic.mat[0][0] != "") &&
        (UILogic.mat[0][0] == UILogic.mat[1][1]) &&
        (UILogic.mat[1][1] == UILogic.mat[2][2])) {
      UILogic.ans = "Win";
      UILogic.winningDirection = "checkLeftDiagonal";
    }

    if ((UILogic.ans != "you win") &&
        (UILogic.mat[2][0] != "") &&
        (UILogic.mat[2][0] == UILogic.mat[1][1]) &&
        (UILogic.mat[1][1] == UILogic.mat[0][2])) {
      UILogic.ans = "Win";
      UILogic.winningDirection = "checkRightDiagonal";
    }

    return UILogic.ans;
  }

  String checkDrawCondition() {
    bool isDraw = true;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (UILogic.mat[i][j] == "") {
          isDraw = false;
          break;
        }
      }
      if (isDraw) {
        continue;
      } else {
        break;
      }
    }
    isDraw ? UILogic.ans = "Draw" : UILogic.ans = "";
    return UILogic.ans;
  }
}
