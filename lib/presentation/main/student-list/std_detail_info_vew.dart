import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mhm_portal/presentation/main/student-list/components/std_feature_list.dart';
import 'package:mhm_portal/presentation/resources/color_manager.dart';
import 'package:mhm_portal/presentation/resources/style_manager.dart';
import 'package:mhm_portal/presentation/resources/value_manager.dart';

class StudentDetailInfoView extends StatelessWidget {
  const StudentDetailInfoView(
      {Key? key,
      this.fName,
      this.lName,
      this.faName,
      this.rgNo,
      this.frontImage,
      this.backImage})
      : super(key: key);
  final fName, lName, faName, rgNo, frontImage, backImage;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorManager.primary),
        title: Text(fName + " " + lName),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // StudentFeatureList(),
          Container(
            // height: 200,
            padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p20, vertical: AppPadding.p20),
            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: InteractiveViewer(
                  child: FlipCard(
                      // direction: FlipDirection.HORIZONTAL,
                      front: Image(image: AssetImage(frontImage)),
                      back: Image(
                        image: AssetImage(backImage),
                      ))),
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Id No: ' + rgNo.toString(),
                  textAlign: TextAlign.start,
                  style: StyleManager()
                      .getFontBoldStyle20(color: ColorManager.white),
                ),
                Text('Name: ' + fName + ' ' + lName,
                    style: StyleManager()
                        .getFontBoldStyle20(color: ColorManager.white)),
                Text('Father Name: ' + faName,
                    style: StyleManager()
                        .getFontBoldStyle20(color: ColorManager.white)),
              ],
            ),
          )
        ],
      )),
    );
  }
}
