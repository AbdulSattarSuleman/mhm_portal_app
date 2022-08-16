import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/style_manager.dart';
import '../../../resources/value_manager.dart';

class StudentSearchBox extends StatelessWidget {
  const StudentSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppMargin.m20),
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppMargin.m20),
          color: ColorManager.white.withOpacity(0.4)),
      child: TextField(
        style: StyleManager().getMediumStyle(color: ColorManager.white),
        decoration: InputDecoration(
            hintText: "Search",
            hintStyle: StyleManager().getMediumStyle(color: ColorManager.white),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            icon: Icon(
              Icons.search,
              color: ColorManager.white,
            )),
      ),
    );
  }
}
