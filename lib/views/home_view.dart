import 'package:flutter/material.dart';
import 'package:flutter-web-portofolio/utils/theme_selector.dart';
import 'package:flutter-web-portofolio/utils/view_wrapper.dart';
import 'package:flutter-web-portofolio/widgets/navigation_arrow.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late double screenWidth;
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return ViewWrapper(desktopView: desktopView(), mobileView: mobileView());
  }

  Widget desktopView() {
    return Stack(
      children: [
        NavigationArrow(isBackArrow: false),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  header(getFontSize(true)),
                  SizedBox(height: screenHeight * 0.05),
                  subheader('Flutter Website', getFontSize(false)),
                  SizedBox(height: screenHeight * 0.01),
                  subheader('TK21A1', getFontSize(false)),
                  SizedBox(height: screenHeight * 0.01),
                  subheader('developed by Kelompok 2', getFontSize(false)),
                  SizedBox(height: screenHeight * 0.01),
                ],
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            profilePicture()
          ],
        )
      ],
    );
  }

  Widget mobileView() {
    return Column(
      children: [
        profilePicture(),
        SizedBox(height: screenHeight * 0.02),
        header(30),
        SizedBox(height: screenHeight * 0.01),
        subheader(' Flutter Website ', 15)
      ],
    );
  }

  double getImageSize() {
    if (screenWidth > 1600 && screenHeight > 800) {
      return 400;
    } else if (screenWidth > 1300 && screenHeight > 600) {
      return 350;
    } else if (screenWidth > 1000 && screenHeight > 400) {
      return 300;
    } else {
      return 250;
    }
  }

  double getFontSize(bool isHeader) {
    double fontSize = screenWidth > 950 && screenHeight > 550 ? 30 : 25;
    return isHeader ? fontSize * 2.25 : fontSize;
  }

  Widget profilePicture() {
    return Container(
      height: getImageSize(),
      width: getImageSize(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(getImageSize() / 2),
        child: Image.asset('tyler.png', fit: BoxFit.cover,),
        ),
      );
  }

  Widget header(double fontSize) {
    return RichText(
      text: TextSpan(
        style: ThemeSelector.selectHeadline(context),
        children: <TextSpan>[
          TextSpan(text: 'Hi, We Are '),
          TextSpan(
              text: 'Kelompok 2', style: TextStyle(color: Color(0xff21a179))),
          TextSpan(text: '!'),
        ],
      ),
    );
  }

  Widget subheader(String text, double fontSize) {
    return Text(text, style: ThemeSelector.selectSubHeadline(context));
  }
}
