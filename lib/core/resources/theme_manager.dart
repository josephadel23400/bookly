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

    //TEXT STYLE
    textTheme: TextTheme(
      displaySmall: GoogleFonts.inter(
        color: ColorsManager.whiteColor,
        fontWeight: FontWeight.w300,
        fontSize: SizeManager.smallFontSize16,
      ),
      displayMedium: GoogleFonts.inter(
        color: ColorsManager.whiteColor,
        fontWeight: FontWeight.w400,
        fontSize: SizeManager.mediumFontSize20,
      ),
      displayLarge: GoogleFonts.inter(
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

class TextStylesManager {
  static TextStyle? displaySmall(BuildContext context,{Color? color,double? size , FontWeight? fontWeight}) =>
      Theme.of(context).textTheme.displaySmall?.copyWith(color: color,fontSize:  size , fontWeight: fontWeight);

  static TextStyle? displayMedium(BuildContext context,{Color? color,double? size , FontWeight? fontWeight}) =>
      Theme.of(context).textTheme.displayMedium?.copyWith(color: color,fontSize:  size , fontWeight: fontWeight);

  static TextStyle? displayLarge(BuildContext context,{Color? color,double? size , FontWeight? fontWeight}) =>
      Theme.of(context).textTheme.displayLarge?.copyWith(color: color,fontSize:  size , fontWeight: fontWeight);
}