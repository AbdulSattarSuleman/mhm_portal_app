import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mhm_portal/models/key_constant.dart';
import 'package:mhm_portal/my_flutter_app_icons.dart';
import 'package:mhm_portal/presentation/resources/color_manager.dart';
import 'package:mhm_portal/presentation/resources/routes_manager.dart';
import 'package:mhm_portal/presentation/resources/value_manager.dart';
import 'package:mhm_portal/services/shared_preferences.dart';
import 'package:mhm_portal/utils/custom_card.dart';
import 'package:mhm_portal/utils/custom_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _username = '';

class MainView extends StatefulWidget {
  MainView({Key? key}) : super(key: key);

  // final String userName =
  //     SharedPreferncesServices.getData(KeyConstants.username);

  _loaddata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  final String username =
      SharedPreferncesServices.getData(KeyConstants.username);
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.primary,
          elevation: AppSize.s0,
          title: Text(
            "Welcome ${widget.username}",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                tooltip: "Logout",
                visualDensity: VisualDensity.adaptivePlatformDensity,
                onPressed: () {
                  // CustomNavigator().goNextScreenReplacement
                  CustomNavigator()
                      .goNextScreenReplacement(context, Routes.loginRoute);
                },
                icon: Icon(MyFlutterApp.logout))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
              physics: BouncingScrollPhysics(),
              primary: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 5),
              children: [
                GestureDetector(
                  onTap: () {
                    CustomNavigator()
                        .goNextScreen(context, Routes.studentListRoute);
                  },
                  child: CustomCard(
                      featureName: "Students",
                      // featureIcon: Icons.system_update_tv_rounded),
                      featureIcon: Icons.school),
                ),
                CustomCard(
                    featureName: "Teachers",
                    // featureIcon: Icons.theater_comedy_sharp),
                    featureIcon: Icons.abc),
                CustomCard(
                    featureName: "CashBooks", featureIcon: Icons.menu_book),
                CustomCard(featureName: "Events", featureIcon: Icons.event),
                CustomCard(
                    featureName: "Examination",
                    featureIcon: Icons.edit_calendar_rounded),
                CustomCard(
                    featureName: "About", featureIcon: Icons.info_outlined),
                CustomCard(
                    featureName: "Projects", featureIcon: Icons.task_sharp),
              ]),
        ),
      ),
    );
  }
}
