import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFFF2CA4);
const Color secondary = Colors.white;


final ColorScheme schemeLight = SeedColorScheme.fromSeeds(
  primary: primaryColor,
  primaryKey: primaryColor,
  secondaryKey: secondary,
  secondary: secondary,
  // tertiaryKey: wgerTertiaryColor,
  brightness: Brightness.light,
  tones: FlexTones.vivid(Brightness.light),
);

final subThemesData = FlexSubThemesData(
  bottomAppBarSchemeColor: SchemeColor.secondary
);

final lightTheme = FlexThemeData.light(
  colorScheme: schemeLight,
  useMaterial3: true,
  appBarStyle: FlexAppBarStyle.primary,
  subThemesData: subThemesData,
  // textTheme: wgerTextTheme,
);