import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mhm_portal/presentation/resources/color_manager.dart';

class StudentFeatureList extends StatefulWidget {
  const StudentFeatureList({
    Key? key,
  }) : super(key: key);

  @override
  State<StudentFeatureList> createState() => _StudentFeatureListState();
}

class _StudentFeatureListState extends State<StudentFeatureList> {
  int itemSelected = 0;
  List categoriesName = [
    'All',
    'Hifz',
    'Nazra',
    'Qaida',
    'Morning',
    'Evening',
    'Night',
    'Qari Nazeer Student',
    'Qari 1 Student',
    'Qari 2 Student',
  ];
  late final Color _color;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: _color,
      height: 60,
      // margin: EdgeInsets.symmetric(vertical: AppMargin.m12),
      child: ListView.builder(
          itemCount: categoriesName.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  itemSelected = index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(
                    top: 20,
                    left: 10,
                    right: index == categoriesName.length - 1 ? 20 : 0),
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: Text(
                  categoriesName[index],
                  style: TextStyle(color: ColorManager.white),
                ),
                decoration: BoxDecoration(
                    color: index == itemSelected
                        ? ColorManager.white.withOpacity(0.4)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
              ),
            );
          }),
    );
  }
}
