import 'package:flutter/material.dart';
import 'package:mhm_portal/view_model/login_api.dart';
import 'package:mhm_portal/presentation/resources/routes_manager.dart';
import 'package:mhm_portal/presentation/resources/strings_manager.dart';
import 'package:mhm_portal/presentation/resources/style_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/custom_input_field.dart';
import '../../utils/custom_rich_text.dart';
import '../resources/color_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isHidden = true;
  bool _isChecked = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      var username = prefs.getString("username");
      prefs.getString("token");
    });
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
          child: ListView(
            children: [
              Center(
                child: Text(
                  AppStrings.logIn,
                  // style: kHead1_25,
                ),
              ),
              Divider(),
              SizedBox(
                height: 60,
              ),
              Text(
                'Email',
                // style: StyleManager().getBoldStyle(color: ColorManager.primary),
              ),
              SizedBox(
                height: 5,
              ),
              CustomInputField(
                  'Email', _emailController, TextInputType.emailAddress),
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
              TextFormField(
                obscureText: _isHidden,
                // keyboardType: inputType,
                controller: _passwordController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: 'Password',
                    // labelText: hintText,
                    suffix: InkWell(
                        onTap: toggleContentView,
                        child: Icon(_isHidden
                            ? Icons.visibility_off_rounded
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
              // remeber Me Checkbox
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.0,
                    width: 24.0,
                    child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: ColorManager.Grey,
                        ),
                        child: Checkbox(
                          activeColor: ColorManager.primary,
                          value: _isChecked,
                          onChanged: _handleRememberme,
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Remember Me",
                    style: StyleManager().getMediumStyle(
                      color: ColorManager.darkGrey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(screenSize.width, 40)),
                  onPressed: () {
                    if (_emailController.text == '' ||
                        _passwordController.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please Enter Email & Password")));
                    } else {
                      ApiClient().login(_emailController.text,
                          _passwordController.text, context);
                    }
                  },
                  child: Text(AppStrings.logIn)),
              CustomRichText(context, "Don't Have An Account?", "Sign Up",
                  Routes.registerRoute),
            ],
          ),
        ),
      ),
    );
  }

  void toggleContentView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  // handlr Remember Me Functionality
  void _handleRememberme(bool? value) {
    _isChecked = value!;
    // SharedPreferences.getInstance().then((prefs) {
    //   prefs.setBool("remember_me", value);
    //   prefs.setString('email', _emailController.text);
    //   prefs.setString('password', _passwordController.text);
    // });

    setState(() {
      _isChecked = true;
    });
  }
}
