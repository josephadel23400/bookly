import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //WIDGET COLORS
    scaffoldBackgroundColor: ColorsManager.primaryBackgroundColor,
    hintColor: ColorsManager.whiteColor,
    primaryColor: ColorsManager.primaryBackgroundColor,
    brightness: Brightness.dark,
    highlightColor: ColorsManager.whiteColor,
    splashColor: ColorsManager.whiteColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsManager.iconOrangeColor,
      selectionHandleColor: ColorsManager.buttonOrangeColor,
    ),

    //TEXT STYLE
    textTheme: TextTheme(
      //displaySmall
      displaySmall: TextStyle(
        //fontFamily: 'Montserrat',
        color: ColorsManager.whiteColor,
        fontWeight: FontWeight.w300,
        fontSize: SizeManager.smallFontSize16,
      ),
      //titleMedium
      titleMedium: GoogleFonts.playfairDisplay(
        color: ColorsManager.whiteColor,
        fontWeight: FontWeight.w500,
        fontSize: SizeManager.mediumFontSize20,
      ),
      //displayMedium
      displayMedium: TextStyle(
        // fontFamily: 'Montserrat',
        color: ColorsManager.whiteColor,
        fontWeight: FontWeight.w400,
        fontSize: SizeManager.mediumFontSize20,
      ),
      //displayLarge
      displayLarge: TextStyle(
        fontFamily: 'Montserrat',
        color: ColorsManager.whiteColor,
        fontWeight: FontWeight.w500,
        fontSize: SizeManager.largeFontSize30,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(SizeManager.radiusFull),
        ),
      ),
    ),
  );
}
