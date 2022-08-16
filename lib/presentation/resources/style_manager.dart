import 'package:flutter/cupertino.dart';
import 'package:mhm_portal/presentation/resources/font_manager.dart';

class StyleManager {
  TextStyle _getTextStyle(
      double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        color: color);
  }

  // Regular Style
  TextStyle getRegularStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return _getTextStyle(
        fontSize, FontConstant.fontfamily, FontWeightmanager.regular, color);
  }

  // Light Style
  TextStyle getLightStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return _getTextStyle(
        fontSize, FontConstant.fontfamily, FontWeightmanager.light, color);
  }

  // Bold Style Font Size 16
  TextStyle getFontBoldStyle(
      {double fontSize = FontSize.s16, required Color color}) {
    return _getTextStyle(
        fontSize, FontConstant.fontfamily, FontWeightmanager.medium, color);
  }

  // Bold Style Font Size 15
  TextStyle getFontBoldStyle15(
      {double fontSize = FontSize.s15, required Color color}) {
    return _getTextStyle(
      fontSize,
      FontConstant.fontfamily,
      FontWeightmanager.medium,
      color,
    );
  }

  // Bold Style Font Size 20
  TextStyle getFontBoldStyle20(
      {double fontSize = FontSize.s20, required Color color}) {
    return _getTextStyle(
      fontSize,
      FontConstant.fontfamily,
      FontWeightmanager.bold,
      color,
    );
  }

  // Bold Style
  TextStyle getBoldStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return _getTextStyle(
        fontSize, FontConstant.fontfamily, FontWeightmanager.bold, color);
  }

  // Semi Bold Style
  TextStyle getSemiBoldStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return _getTextStyle(
        fontSize, FontConstant.fontfamily, FontWeightmanager.semiBold, color);
  }

  // Medium Style
  TextStyle getMediumStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return _getTextStyle(
        fontSize, FontConstant.fontfamily, FontWeightmanager.medium, color);
  }
}
