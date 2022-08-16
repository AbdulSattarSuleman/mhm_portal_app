import 'package:flutter/material.dart';

import 'package:mhm_portal/presentation/resources/color_manager.dart';

Widget CustomInputField(
  String hintText,
  TextEditingController? getInputController,
  TextInputType inputType, [
  bool isHidden = false,
]) {
  return TextFormField(
    obscureText: isHidden,
    keyboardType: inputType,
    controller: getInputController,
    decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        hintText: hintText,
        // labelText: hintText,
        // suffix:
        //     InkWell(onTap:, child: Icon(Icons.visibility)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          width: 1,
          color: ColorManager.primary,
          style: BorderStyle.solid,
        )),
        border: OutlineInputBorder(borderSide: BorderSide.none)),
  );
}
