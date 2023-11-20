// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class MyTheme {
  static ThemeData lightTheme() {
    return FlexThemeData.light(
      colors: const FlexSchemeColor(
        primary: Color.fromARGB(255, 255, 255, 255),
        primaryContainer: Color(0xff000000),
        secondary: Color(0xffff0000),
        secondaryContainer: Color(0xfff3f3f3),
        tertiary: Color(0xff000000),
        tertiaryContainer: Color(0xffffffff),
        appBarColor: Color(0xfff3f3f3),
        error: Color(0xffb00020),
      ),
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        blendOnColors: false,
        useTextTheme: true,
        useM2StyleDividerInM3: true,
        inputDecoratorBorderType: FlexInputBorderType.underline,
        inputDecoratorUnfocusedHasBorder: false,
        inputDecoratorFocusedHasBorder: false,
        chipSchemeColor: SchemeColor.tertiary,
        chipSelectedSchemeColor: SchemeColor.onPrimaryContainer,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,
        menuItemBackgroundSchemeColor: SchemeColor.secondary,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      // To use the Playground font, add GoogleFonts package and uncomment
      // fontFamily: GoogleFonts.notoSans().fontFamily,
    );
  }

  static ThemeData darkTheme() {
    return FlexThemeData.dark(
      colors: const FlexSchemeColor(
        primary: Color(0xff9fc9ff),
        primaryContainer: Color(0xff00325b),
        secondary: Color(0xffffb59d),
        secondaryContainer: Color(0xff872100),
        tertiary: Color(0xff86d2e1),
        tertiaryContainer: Color(0xff004e59),
        appBarColor: Color(0xff872100),
        error: Color(0xffcf6679),
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 13,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        useTextTheme: true,
        useM2StyleDividerInM3: true,
        inputDecoratorBorderType: FlexInputBorderType.underline,
        inputDecoratorUnfocusedHasBorder: false,
        inputDecoratorFocusedHasBorder: false,
        chipSchemeColor: SchemeColor.tertiary,
        chipSelectedSchemeColor: SchemeColor.onPrimaryContainer,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,
        menuItemBackgroundSchemeColor: SchemeColor.secondary,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      // To use the Playground font, add GoogleFonts package and uncomment
      // fontFamily: GoogleFonts.notoSans().fontFamily,
    );
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
  }

  static of(BuildContext context) {}
}
