import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mhm_portal/presentation/resources/color_manager.dart';
import 'package:mhm_portal/utils/custom_navigator.dart';

Widget CustomRichText(
  BuildContext context,
  String title,
  String signUp,
  String className,
) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
    child: Center(
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "$title",
            style: TextStyle(
              color: Colors.black,
            )),
        TextSpan(
            text: '\t $signUp',
            style: TextStyle(
              color: ColorManager.primary,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // GotoNextScreenFunc(context, className);
                CustomNavigator().goNextScreen(context, className);
              })
      ])),
    ),
  );
}
