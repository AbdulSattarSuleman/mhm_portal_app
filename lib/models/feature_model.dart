import 'package:flutter/material.dart';
import 'package:mhm_portal/constant.dart';

class FeatureModel {
  String? featureTitle;
  Icon? featureImage;
  Color? featureBoxColor;

  FeatureModel(
      {required this.featureTitle,
      required this.featureBoxColor,
      required this.featureImage});
}

List<FeatureModel> featureModeldata = [
  FeatureModel(
      featureTitle: 'Student',
      featureImage: featureImages[0],
      featureBoxColor: Colors.red),
  FeatureModel(
      featureTitle: 'Teacher',
      featureImage: featureImages[1],
      featureBoxColor: Colors.orange.shade200),
  FeatureModel(
      featureTitle: 'Examination',
      featureImage: featureImages[2],
      featureBoxColor: Colors.green.shade200),
  FeatureModel(
      featureTitle: 'Expenses',
      featureImage: featureImages[3],
      featureBoxColor: Colors.brown.shade200),
  FeatureModel(
      featureTitle: 'Other',
      featureImage: featureImages[4],
      featureBoxColor: Colors.blue.shade200),
];
