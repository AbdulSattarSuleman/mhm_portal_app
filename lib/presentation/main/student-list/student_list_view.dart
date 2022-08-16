import 'package:flutter/material.dart';
import 'package:mhm_portal/models/std_info_model.dart';
import 'package:mhm_portal/my_flutter_app_icons.dart';
import 'package:mhm_portal/presentation/main/student-list/components/std_card_list.dart';
import 'package:mhm_portal/presentation/main/student-list/components/std_feature_list.dart';
import 'package:mhm_portal/presentation/resources/color_manager.dart';
import 'package:mhm_portal/presentation/resources/routes_manager.dart';
import 'package:mhm_portal/presentation/resources/strings_manager.dart';
import 'package:mhm_portal/presentation/resources/style_manager.dart';
import 'package:mhm_portal/presentation/resources/value_manager.dart';
import 'package:mhm_portal/utils/custom_navigator.dart';

import 'components/std_search_box.dart';

class StudentListView extends StatelessWidget {
  final stdNameController = TextEditingController();
  final stdFNameController = TextEditingController();
  final stdContactController = TextEditingController();
  final stdQariNameController = TextEditingController();
  final stdShiftController = TextEditingController();
  final stdCardFrontController = TextEditingController();
  final stdCardBackController = TextEditingController();
  StudentListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StudentInfo studentInfo;
    List<StudentInfo> _studentInfoList;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        title: Text(
          AppStrings.stdAppBarTitle,
          style: TextStyle(color: ColorManager.white),
        ),
        elevation: AppSize.s0,
        actions: [
          IconButton(
              onPressed: () {
                CustomNavigator()
                    .goNextScreenReplacement(context, Routes.loginRoute);
              },
              icon: Icon(MyFlutterApp.logout))
        ],
      ),
      drawer: Drawer(
        backgroundColor: ColorManager.primary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                // decoration: BoxDecoration(color: ColorManager.primary),
                child: Text(
              'Student',
              style: StyleManager().getFontBoldStyle(color: Colors.white),
            )),
            ListTile(
              title: Text(
                AppStrings.stdFeature1,
                style: StyleManager().getFontBoldStyle15(
                  color: ColorManager.white,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                AppStrings.stdFeature2,
                style: StyleManager().getFontBoldStyle15(
                  color: ColorManager.white,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                AppStrings.stdFeature3,
                style: StyleManager().getFontBoldStyle15(
                  color: ColorManager.white,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                AppStrings.stdFeature4,
                style: StyleManager().getFontBoldStyle15(
                  color: ColorManager.white,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                AppStrings.stdFeature5,
                style: StyleManager().getFontBoldStyle15(
                  color: ColorManager.white,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          StudentSearchBox(),
          StudentFeatureList(),
          // SizedBox(
          //   height: 5,
          // ),
          Expanded(
              child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
              ListView.builder(
                  itemCount: studentList.length,
                  itemBuilder: (context, index) {
                    return StudentInfoCard(
                      stdIndex: studentList[index].regId,
                      fName: studentList[index].fName,
                      lName: studentList[index].lName,
                      faName: studentList[index].faName,
                      imageUrl: studentList[index].stdImage,
                      cardbackImage: studentList[index].stdCardBackImage,
                      cardFrontImage: studentList[index].stdCardfrontImage,
                    );
                  })
            ],
          ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        foregroundColor: ColorManager.white,
        backgroundColor: ColorManager.primary,
        onPressed: () {
          addStudentData(context);
        },
        // child: Icon(Icons.add),
      ),
    );
  }

  addStudentData(BuildContext context) {
    return showDialog(
        barrierDismissible: true,
        barrierColor: ColorManager.white,
        // anchorPoint: Offset(200, 20),
        // barrierLabel: "Student Information",
        // routeSettings: RouteSettings(),
        // useRootNavigator: true,
        useSafeArea: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // titlePadding: EdgeInsets.all(AppPadding.p12),
            alignment: Alignment.center,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            // contentPadding: EdgeInsets.zero,
            title: Text('Add Student Data'),
            content: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -80,
                  right: -40,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      child: Icon(
                        Icons.close,
                        color: ColorManager.white,
                      ),
                      backgroundColor: ColorManager.primary,
                    ),
                  ),
                ),
                Form(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(AppPadding.p8),
                      child: TextFormField(
                        focusNode: FocusNode(),
                        decoration: InputDecoration(
                          hintText: "Student Name",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(AppPadding.p8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Father Name",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(AppPadding.p8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Contact No.",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(AppPadding.p8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Qari Name",
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          );
        });
  }
}
