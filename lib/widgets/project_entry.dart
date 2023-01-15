import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/project_models.dart';
import 'package:flutter_application_2/utils/theme_selector.dart';

class ProjectEntry extends StatelessWidget {
  const ProjectEntry({Key? key, required this.project}) : super(key: key);
  final Project project;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Text(
          project.title ?? '',
          style: ThemeSelector.selectSubHeadline(context),
        ),
        SizedBox(height: screenHeight * 0.05),
        Text(
          project.description ?? '',
          style: ThemeSelector.selectBodyText(context),
        )
      ],
    );
  }
}
