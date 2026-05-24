
import 'package:flutter/material.dart';

class TextStylesManager {
  static TextStyle? displaySmall(
      BuildContext context, {
        Color? color,
        double? size,
        FontWeight? fontWeight,
      }) => Theme.of(context).textTheme.displaySmall?.copyWith(
    color: color,
    fontSize: size,
    fontWeight: fontWeight,
  );
  static TextStyle? titleMedium(
      BuildContext context, {
        Color? color,
        double? size,
        FontWeight? fontWeight,
      }) => Theme.of(context).textTheme.titleMedium?.copyWith(
    color: color,
    fontSize: size,
    fontWeight: fontWeight,
  );

  static TextStyle? displayMedium(
      BuildContext context, {
        Color? color,
        double? size,
        FontWeight? fontWeight,
      }) => Theme.of(context).textTheme.displayMedium?.copyWith(
    color: color,
    fontSize: size,
    fontWeight: fontWeight,
  );

  static TextStyle? displayLarge(
      BuildContext context, {
        Color? color,
        double? size,
        FontWeight? fontWeight,
      }) => Theme.of(context).textTheme.displayLarge?.copyWith(
    color: color,
    fontSize: size,
    fontWeight: fontWeight,
  );
}
