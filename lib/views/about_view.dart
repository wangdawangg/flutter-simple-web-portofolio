import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/theme_selector.dart';
import 'package:flutter_application_2/utils/view_wrapper.dart';
import 'package:flutter_application_2/widgets/bullet_list.dart';
import 'package:flutter_application_2/widgets/navigation_arrow.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView>
    with SingleTickerProviderStateMixin {
  late double screenWidth;
  late double screenHeight;
  String loremIpsum =
      'Lorem ipsum dolor sit amet, constetur sadipscing elitr, sed diam nomuny eirmod tempor invidunt ut laber et dolor magna aliquyam erat, sed diam voluptua.';

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return ViewWrapper(
      desktopView: desktopView(),
      mobileView: mobileView(),
    );
  }

  Widget desktopView() {
    return Stack(
      children: [
        NavigationArrow(isBackArrow: false),
        NavigationArrow(isBackArrow: true),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            Expanded(flex: 3, child: infoSection()),
            Spacer(flex: 1),
            Expanded(
                flex: 3,
                child: BulletList(
                  strings: [loremIpsum, loremIpsum, loremIpsum, loremIpsum],
                )),
            Spacer(flex: 1),
          ],
        )
      ],
    );
  }

  Widget mobileView() {
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.05),
        infoText(),
        SizedBox(height: screenHeight * 0.05),
        Container(
          height: screenHeight * 0.35,
          child: BulletList(
            strings: [loremIpsum, loremIpsum, loremIpsum, loremIpsum],
          ),
        ),
      ],
    );
  }

  Widget infoSection() {
    return Container(
      width: screenWidth * 0.35,
      child: Column(
        children: [
          profilePicture(),
          SizedBox(height: screenHeight * 0.05),
          infoText()
        ],
      ),
    );
  }

  Widget profilePicture() {
    return Container(
      height: getImageSize(),
      width: getImageSize(),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(getImageSize() / 2),
          child: Container(
            color: Colors.transparent,
            child: Image.asset('tyler.png', fit: BoxFit.cover)),
          ),
    );
  }

  double getImageSize() {
    if (screenWidth > 1600 && screenHeight > 800) {
      return 350;
    } else if (screenWidth > 1300 && screenHeight > 600) {
      return 300;
    } else if (screenWidth > 1000 && screenHeight > 400) {
      return 200;
    } else {
      return 150;
    }
  }

  Widget infoText() {
    return Text(
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasdgubergren, no sea takimata sanctus est Lorem Ipsum dolor si amet. Lorem Ipsum dolor sit amet, constetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, noe sea takimata sanctus est Lorem ipsum dolor sit amet.',
      overflow: TextOverflow.clip,
      style: ThemeSelector.selectBodyText(context),
    );
  }
}
