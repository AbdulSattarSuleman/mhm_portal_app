import 'package:flutter/material.dart';
import 'package:mhm_portal/presentation/resources/routes_manager.dart';
import 'package:mhm_portal/presentation/resources/strings_manager.dart';
import 'package:mhm_portal/utils/custom_navigator.dart';

import '../../utils/custom_input_field.dart';
import '../../utils/custom_rich_text.dart';
import '../resources/color_manager.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _isHiddenPassword = true;
  bool _isHiddenCPassword = true;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final cnPasswordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Center(
                child: Text(
                  AppStrings.signUp,
                  // style: kHead1_25,
                ),
              ),
              Divider(),
              SizedBox(
                height: 30,
              ),
              Text(
                'Name',
                // style: labelTextStyle,
              ),
              SizedBox(
                height: 5,
              ),
              CustomInputField('Full Name', nameController, TextInputType.name),
              SizedBox(
                height: 30,
              ),
              Text(
                'Email',
                // style: labelTextStyle,
              ),
              SizedBox(
                height: 5,
              ),
              CustomInputField(
                  'Email', emailController, TextInputType.emailAddress),
              SizedBox(
                height: 30,
              ),
              Text(
                'Password',
                // style: labelTextStyle,
              ),
              SizedBox(
                height: 5,
              ),
              // CustomInputField('Password', _passwordController,
              //     TextInputType.visiblePassword, true),
              TextFormField(
                obscureText: _isHiddenPassword,
                // keyboardType: inputType,
                controller: _passwordController,
                decoration: InputDecoration(
                    // contentPadding: EdgeInsets.only(top: 2),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: 'Password',
                    // labelText: hintText,
                    suffix: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(_isHiddenPassword
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 1,
                      color: ColorManager.primary,
                      style: BorderStyle.solid,
                    )),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Confirm Password',
                // style: labelTextStyle,
              ),
              SizedBox(
                height: 5,
              ),

              // Confirm password Field
              TextFormField(
                obscureText: _isHiddenCPassword,
                // keyboardType: inputType,
                controller: cnPasswordController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: 'Confirm Password',
                    // labelText: hintText,
                    suffix: InkWell(
                        onTap: _toggleCPasswordView,
                        child: Icon(_isHiddenCPassword
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 1,
                      color: ColorManager.primary,
                      style: BorderStyle.solid,
                    )),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                AppStrings.disclaimerText,
                // style: ktext_13,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(screenSize.width, 40)),
                  onPressed: () {
                    CustomNavigator().goNextScreen(context, Routes.loginRoute);
                  },
                  child: Text(AppStrings.signUp)),
              CustomRichText(context, "Already Have An Account?", "Sign In",
                  Routes.loginRoute),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }

  void _toggleCPasswordView() {
    setState(() {
      _isHiddenCPassword = !_isHiddenCPassword;
    });
  }
}
