import 'package:flutter/material.dart';
import 'package:remorquage/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:remorquage/utils/theme/custom_themes/chip_theme.dart';
import 'package:remorquage/utils/theme/custom_themes/text_theme.dart';
import 'package:remorquage/utils/theme/custom_themes/appbar_theme.dart';
import 'package:remorquage/utils/theme/custom_themes/buttom_sheet_theme.dart';
import 'package:remorquage/utils/theme/custom_themes/text_theme.dart';
import 'package:remorquage/utils/theme/custom_themes/text_field_theme.dart';
import 'package:remorquage/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:remorquage/utils/theme/custom_themes/outlined_button_theme.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    chipTheme: TchipTheme.lightChipTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,

    elevatedButtonTheme: TElevatedButtonTheme.darktElevatedButtonTheme,
    chipTheme: TchipTheme.darkChipTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    appBarTheme: TAppBarTheme.darktAppBarTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darckOutlinedButtonTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    inputDecorationTheme: TTextFormFieldTheme.darktInputDecorationTheme,
  );
}
