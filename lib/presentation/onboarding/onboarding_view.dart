// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mhm_portal/presentation/resources/assets_manager.dart';
import 'package:mhm_portal/presentation/resources/color_manager.dart';
import 'package:mhm_portal/presentation/resources/routes_manager.dart';
import 'package:mhm_portal/presentation/resources/strings_manager.dart';
import 'package:mhm_portal/presentation/resources/value_manager.dart';
import 'package:mhm_portal/utils/custom_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _getSliderData();

  PageController _pageController = PageController(initialPage: 0);

  int _currentIndex = 0;
  bool _isSkipped = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1, AppStrings.onBoardingTitle1,
            ImageAssets.onBoardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2, AppStrings.onBoardingTitle2,
            ImageAssets.onBoardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3, AppStrings.onBoardingTitle3,
            ImageAssets.onBoardingLogo3),
        // SliderObject(AppStrings.onBoardingTitle4, AppStrings.onBoardingTitle4,
        //     ImageAssets.onBoardingLogo4),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: Text(AppStrings.onBoardingAppBarTitle),
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          itemCount: _list.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            // return onBoardingPage
            return OnBoardingPage(_list[index]);
          }),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () async {
                      // final SharedPreferences sharedPreferences = await _prefs;
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.setBool('isSkipped', true);
                      _isSkipped = true;
                      // CustomNavigator()
                      //     .goNextScreen(context, Routes.registerRoute);
                      CustomNavigator()
                          .goNextScreenReplacement(context, Routes.loginRoute);
                    },
                    child: Text(
                      AppStrings.skip,
                      style: Theme.of(context).textTheme.subtitle2,
                      textAlign: TextAlign.end,
                    ))),

            //  Add Layout for indicator
            _getBottomSheetRow()
          ],
        ),
      ),
    );
  }

  // Bottom Row Widget Fuction
  Widget _getBottomSheetRow() {
    return Container(
      // margin: EdgeInsets.only(top: 5),
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Arrow
          Padding(
            padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              ),
              //Goto Previuos Slide
              onTap: () {
                _pageController.animateToPage(_goPreviousIndex(),
                    duration: Duration(milliseconds: DurationConstant.d300),
                    curve: Curves.bounceInOut);
              },
            ),
          ),

          // Circle Indicator
          Row(
            children: [
              for (int i = 0; i < _list.length; i++)
                Padding(
                  padding: EdgeInsets.all(AppPadding.p18),
                  child: _getProperCircle(i),
                )
            ],
          ),
          // Right Arrow
          Padding(
            padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrowIc),
              ),
              //  Goto Next Slider
              onTap: () {
                _pageController.animateToPage(_goNextIndex(),
                    duration: Duration(milliseconds: DurationConstant.d300),
                    curve: Curves.bounceInOut);
              },
            ),
          ),
        ],
      ),
    );
  }

  int _goPreviousIndex() {
    int previousIndex = _currentIndex--; // -1
    if (previousIndex == -1) {
      _currentIndex == _list.length - 1; // Infinite loop go to next slider
    }
    return _currentIndex;
  }

  int _goNextIndex() {
    int nextIndex = _currentIndex++; // +1
    if (nextIndex >= _list.length) {
      _currentIndex == 0; // Infinite loop go to next slider
    }
    return _currentIndex;
  }

  // Indicator Widget Function
  Widget _getProperCircle(int index) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc); // Selected Slider
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc); // Unselected Slider
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);
  SliderObject _sliderObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: AppSize.s45,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(AppPadding.p8),
        //   child: Text(
        //     _sliderObject.subTitle,
        //     textAlign: TextAlign.center,
        //     style: Theme.of(context).textTheme.subtitle1,
        //   ),
        // ),
        SizedBox(
          height: AppSize.s60,
        ),

        //Svg Image Widget
        // SvgPicture.asset(_sliderObject.image),
        // Png Asset Image
        Image(
          image: AssetImage(_sliderObject.image),
          fit: BoxFit.fitWidth,
          filterQuality: FilterQuality.high,
          // height: 200,
        )
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
