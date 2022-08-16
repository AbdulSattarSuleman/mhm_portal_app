import 'package:flutter/material.dart';
import 'package:mhm_portal/presentation/resources/strings_manager.dart';
import 'package:mhm_portal/presentation/resources/value_manager.dart';

import '../presentation/resources/assets_manager.dart';
import '../presentation/resources/color_manager.dart';
import '../presentation/resources/style_manager.dart';

Widget CustomCard(
    {required String featureName, required IconData featureIcon}) {
  return Card(
    elevation: AppSize.s1_5,
    borderOnForeground: true,
    clipBehavior: Clip.hardEdge,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: ColorManager.primary,
          child: SizedBox(
            width: 200,
            child: Icon(
              featureIcon,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          featureName,
          style: StyleManager().getFontBoldStyle(
            color: ColorManager.darkGrey,
          ),
        ),
      ],
    ),
  );
}
