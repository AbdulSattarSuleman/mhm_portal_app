import 'package:flutter/material.dart';
import 'package:mhm_portal/constant.dart';
import 'package:mhm_portal/presentation/resources/style_manager.dart';

class FeatureScreen extends StatelessWidget {
  const FeatureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List featureCategoryTitle = [];
    // for(var item in FeatureModel)
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: SafeArea(
          child: GridView.builder(
              itemCount: featureImages.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      child: Icon(featureImages[index]),
                      width: screenSize.width * 0.5,
                      height: screenSize.height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: boxColor[index],
                      ),
                    ),
                    Text(
                      'Student',
                      style: StyleManager().getBoldStyle(color: Colors.black),
                    )
                  ],
                );
              })),
    );
  }
}
