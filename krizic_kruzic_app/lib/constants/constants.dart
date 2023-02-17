import 'package:flutter/material.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';

class AppConstants {
  static const gameScreenBackgroundColor = Color(0XFF36248D);
  static const letterXColor = Color(0xFFCC99FF);
  static const letterOColor = Color(0xFFFFFFFF);
  static const settingsBoxColor = Color(0xFF9b70e5);
  static const profileContainerColor = Color(0XFF27175D);

  static const kG = "";

  static const textFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
    fillColor: AppColors.secondaryMainColor,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
      borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(color: Colors.white),
  );

  static const settingsBoxLetterStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'Impact',
  );

  static const yourTurnText = TextStyle(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );

  static const scoreTextStyle = TextStyle(
    fontSize: 28.0,
    color: Colors.white,
    fontFamily: 'Impact',
  );

  static const resultText = TextStyle(
    color: Colors.white,
    fontFamily: 'Impact',
  );

  static const divider = Divider(
    height: 6.0,
    color: Colors.white,
    thickness: 0.5,
  );
}
