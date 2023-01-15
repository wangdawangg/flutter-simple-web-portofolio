import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_application_2/widgets/custom_icon_button.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            child: Container(
              height: 2,
              width: screenWidth * 0.9,
              color: Colors.white,
            )),
        Container(
          height: screenHeight * 0.05,
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.05, right: screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomIconButton(
                      iconData: FontAwesomeIcons.github,
                      url: '',
                      color: Colors.white,
                    ),
                    SizedBox(width: screenWidth * 0.02),
                  ],
                ),
                Text('Made with Flutter Web',
                    style: TextStyle(color: Colors.white, fontFamily: 'Barlow'))
              ],
            ),
          ),
        )
      ],
    );
  }
}
