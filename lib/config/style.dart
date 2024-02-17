import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:TOIO/config/colors.dart';

class AppTheme {
  ThemeData light = ThemeData(
      fontFamily: 'poppins',
      cardColor: AppColors().tasksItemLightColor,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
      useMaterial3: true,
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: AppColors().nBlack,
          fontWeight: FontWeight.w900,
          fontSize: 40.0,
        ),
        titleMedium: TextStyle(
          color: AppColors().nLightBlack,
          fontWeight: FontWeight.w600,
          fontSize: 20.0,
        ),
        titleSmall: TextStyle(
          color: AppColors().nLightBlack,
          fontSize: 15.0,
        ),
        bodyLarge: TextStyle(
          color: AppColors().nLightBlack,
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
        ),
        bodyMedium: TextStyle(
          color: AppColors().nLightBlack,
          fontWeight: FontWeight.bold,
          fontSize: 12.0,
        ),
        bodySmall: TextStyle(
          color: AppColors().nLightBlack,
          fontSize: 10.0,
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: AppColors().nBlack,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: AppColors().nBlack,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: null)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 8.0,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        selectedIconTheme: const IconThemeData(size: 20.0),
        selectedItemColor: AppColors().bussinesslColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
      ),
      hintColor: AppColors().nBlack,
      iconTheme: IconThemeData(color: AppColors().lightBorder));

  ThemeData dark = ThemeData(
      fontFamily: 'poppins',
      primaryColor: Colors.redAccent,
      cardColor: AppColors().tasksItemDarkColor,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      useMaterial3: true,
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: AppColors().nWhite,
          fontWeight: FontWeight.w900,
          fontSize: 40.0,
        ),
        titleMedium: TextStyle(
          color: AppColors().nWhite,
          fontWeight: FontWeight.w600,
          fontSize: 20.0,
        ),
        titleSmall: TextStyle(
          color: AppColors().nLightWhite,
          fontSize: 15.0,
        ),
        bodyLarge: TextStyle(
          color: AppColors().nLightWhite,
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
        ),
        bodyMedium: TextStyle(
          color: AppColors().nLightWhite,
          fontWeight: FontWeight.bold,
          fontSize: 12.0,
        ),
        bodySmall: TextStyle(
          color: AppColors().nLightWhite,
          fontSize: 10.0,
        ),
      ),
      scaffoldBackgroundColor: AppColors().darkModeColor,
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
              color: AppColors().nWhite,
              fontWeight: FontWeight.bold,
              fontSize: 27),
          elevation: 0.0,
          backgroundColor: AppColors().nWhite,
          iconTheme: IconThemeData(
            color: AppColors().nWhite,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: null)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black87,
        elevation: 8.0,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        selectedIconTheme: const IconThemeData(size: 20.0),
        selectedItemColor: AppColors().splashBtnColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
      ),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(splashColor: Colors.transparent),
      hintColor: Colors.white,
      iconTheme: IconThemeData(color: AppColors().darkBorder));
}
