import 'package:flutter/material.dart';
import 'package:flutter-web-portofolio/utils/project_models.dart';
import 'package:flutter-web-portofolio/utils/theme_selector.dart';
import 'package:flutter-web-portofolio/utils/view_wrapper.dart';
import 'package:flutter-web-portofolio/widgets/navigation_arrow.dart';
import 'package:flutter-web-portofolio/widgets/project_entry.dart';
import 'package:flutter-web-portofolio/widgets/project_image.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({Key? key}) : super(key: key);

  @override
  _ProjectViewState createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  late double screenWidth;
  late double screenHeight;
  int selectedIndex = 0;
  List<Project> projects = [
    Project(
        title: 'Project 1 ',
        imageUrl: 'project1.jpg',
        description: 'Lorem ipsum dolor sit amet, constetur sadipscing elitr, \nsed diam nomuny eirmod tempor invidunt ut laber et dolor magna aliquyam erat, \nsed diam voluptua.'),
    Project(
      title: 'Project 2 ', 
      imageUrl: 'project2.jpg', 
      description: 'Lorem ipsum dolor sit amet, constetur sadipscing elitr, \nsed diam nomuny eirmod tempor invidunt ut laber et dolor magna aliquyam erat, \nsed diam voluptua.'),
    Project(
      title: 'Project 3 ', 
      imageUrl: 'project3.jpg', 
      description: 'Lorem ipsum dolor sit amet, constetur sadipscing elitr, \nsed diam nomuny eirmod tempor invidunt ut laber et dolor magna aliquyam erat, \nsed diam voluptua.'),
  ];

  @override
  void didChangeDependencies() {
    precacheImage(AssetImage('project1.jpg'), context);
    precacheImage(AssetImage('project2.jpg'), context);
    precacheImage(AssetImage('project3.jpg'), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return ViewWrapper(desktopView: desktopView(), mobileView: mobileView());
  }

  Widget desktopView() {
    double space = MediaQuery.of(context).size.height * 0.03;
    List<Widget> images =
        List.generate((projects.length * 1.5).ceil(), (index) {
      if (index.isEven) {
        return ProjectImage(
            project: projects[index ~/ 2],
            onPressed: () => updateIndex(index ~/ 2));
      } else {
        return SizedBox(height: space);
      }
    });
    return Stack(
      children: [
        NavigationArrow(isBackArrow: true),
        Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.05, horizontal: screenWidth * 0.1),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: images,
                ),
                SizedBox(width: space),
                Container(
                  height: screenHeight * 0.2 * 2 * space * 2,
                  child: Stack(
                    children: [
                      AnimatedAlign(
                        alignment: selectedIndex == 0
                            ? Alignment.topCenter
                            : selectedIndex == 1
                                ? Alignment.center
                                : Alignment.bottomCenter,
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.fastOutSlowIn,
                        child: Container(
                          color: Colors.white,
                          width: screenWidth * 0.05,
                          height: 3,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: space),
                Expanded(child: ProjectEntry(project: projects[selectedIndex]))
              ],
            )),
      ],
    );
  }

  Widget mobileView() {
    List<Widget> projectList = List.generate(projects.length, (index) {
      return Column(
        children: [
          Text(
            projects[index].title ?? '',
            style: ThemeSelector.selectSubHeadline(context),
          ),
          SizedBox(height: screenHeight * 0.01),
          Container(
            height: screenHeight * 0.1,
            width: screenWidth,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                projects[index].imageUrl ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            projects[index].description ?? '',
            style: ThemeSelector.selectBodyText(context),
          ),
          SizedBox(height: screenHeight * 0.1),
        ],
      );
    });
    return Column(children: projectList);
  }

  void updateIndex(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }
}
