import 'package:flutter/material.dart';

class AppColors {
  Color nBlack = Colors.black;
  Color nLightBlack = Colors.black45;
  Color nGray = Colors.grey;
  Color nHintColor = Colors.black54;
  Color nWhite = Colors.white;
  Color nLightWhite = Colors.white54;
  Color myColor = const Color(0xFFefefef);
  Color favColor = const Color(0xFFf5f5f5);
  Color darkModeColor = const Color(0xff121212);

  // Color personalColor = const Color(0xffffa55d);
  Color personalColor = Colors.deepOrangeAccent;
  Color bussinesslColor = const Color(0xff45b3e0);
  Color favouriteColor = Colors.redAccent.withOpacity(0.3);
  Color splashBtnColor = const Color(0xffffa55d);

  Color lightBorder = Colors.black54;
  Color darkBorder = Colors.white54;

  Color tasksItemLightColor = Colors.white;
  Color tasksItemDarkColor = Colors.white12;
  LinearGradient linearColor = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFfc00ff),
        Color(0xFF00dbde),
      ]);

  LinearGradient statesLinearColor = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.deepOrangeAccent,
        Color(0xff45b3e0),
      ]);
  LinearGradient businessLinearColor = const LinearGradient(colors: [
    Color(0xFF36d1dc),
    Color(0xFF5b86e5),
  ]);
  LinearGradient personalLinearColor = const LinearGradient(colors: [
    Color(0xFFff5f6d),
    Color(0xffffa55d),
  ]);
}
