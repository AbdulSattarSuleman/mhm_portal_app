import 'package:flutter/material.dart';
import 'package:mhm_portal/presentation/resources/color_manager.dart';
import 'package:mhm_portal/presentation/resources/font_manager.dart';
import 'package:mhm_portal/presentation/resources/style_manager.dart';
import 'package:mhm_portal/presentation/resources/value_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // Main Colors of the App
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryColorOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.Grey,
    ),

    // Ripple Color
    splashColor: ColorManager.primaryColorOpacity70,

    // Card View theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.Grey,
      elevation: AppSize.s4,
    ),

    // App bar Theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: AppSize.s14,
      shadowColor: ColorManager.primaryColorOpacity70,
      color: ColorManager.primary,
      titleTextStyle: StyleManager().getBoldStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s16,
      ),
    ),
    // Button Theme
    buttonTheme: ButtonThemeData(
      disabledColor: ColorManager.grey1,
      shape: StadiumBorder(),
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryColorOpacity70,
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle:
                StyleManager().getRegularStyle(color: ColorManager.white),
            primary: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(AppSize.s12)))), // Text Theme
    textTheme: TextTheme(
        headline1: StyleManager().getSemiBoldStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.s16),
        subtitle1: StyleManager().getMediumStyle(
            color: ColorManager.lightGrey, fontSize: FontSize.s14),
        subtitle2: StyleManager().getMediumStyle(
            color: ColorManager.primary, fontSize: FontSize.s14),
        caption: StyleManager().getRegularStyle(color: ColorManager.grey1),
        bodyText1: StyleManager().getLightStyle(color: ColorManager.Grey)),
    // Input Decoration theme (Text Form Field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),
      // Hint Style
      hintStyle: StyleManager().getRegularStyle(color: ColorManager.grey1),
      // Label Style
      labelStyle: StyleManager().getMediumStyle(color: ColorManager.darkGrey),
      // error Style
      errorStyle: StyleManager().getRegularStyle(color: ColorManager.error),
      // enable border
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.Grey, width: AppSize.s1_5)),
      // focus Border
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5)),
      // error Border
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5)),
      // focus error Border
      focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5)),
    ),
  );
}
