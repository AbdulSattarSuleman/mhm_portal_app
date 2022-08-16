import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mhm_portal/presentation/main/student-list/std_detail_info_vew.dart';

import '../../../resources/color_manager.dart';

class StudentInfoCard extends StatelessWidget {
  const StudentInfoCard({
    Key? key,
    required this.stdIndex,
    required this.fName,
    required this.lName,
    required this.faName,
    required this.cardFrontImage,
    required this.cardbackImage,
    required String imageUrl,
  }) : super(key: key);
  final int stdIndex;
  final String fName, lName, faName;
  final String cardFrontImage, cardbackImage;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        // vertical: 10,
        vertical: 0,
      ),
      height: 160,
      // color: ColorManager.primaryColorOpacity70,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Those are our background
          Container(
            height: 136,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: stdIndex.isEven ? ColorManager.primary : Colors.blue,
                boxShadow: []),
            child: Container(
              margin: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(22)),
            ),
          ),
          // Student Image,
          Positioned(
            top: 10,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 180,
              // image is square but we add extra 20 + 20 padding thats why is 200
              width: 180,
              child: GestureDetector(
                onTap: () {},
                child: Image(
                  image: AssetImage(cardFrontImage),
                  fit: BoxFit.contain,
                ),
                // child: ImageCropper(),
              ),
            ),
          ),
          // Product Title and Price
          Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 136,
                // image takes 200 width that why we set total width - 200
                width: screenSize.width - 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        ' ${fName + ' ' + lName + ' ' + faName}',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Id: ${stdIndex}',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    // it use available space
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => StudentDetailInfoView(
                                      fName: fName,
                                      lName: lName,
                                      faName: faName,
                                      frontImage: cardFrontImage,
                                      backImage: cardbackImage,
                                      rgNo: stdIndex,
                                    )));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20 * 1.5,
                          vertical: 20 / 4, // 5 top and bottom padding
                        ),
                        decoration: BoxDecoration(
                            color: ColorManager.primary,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: Text('For more info'),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
