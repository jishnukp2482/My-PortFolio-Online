import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/project_response_model.dart';

import 'package:potfolio/portfolio/presentation/pages/projects/desktop/project_view_desktop.dart';
import 'package:potfolio/portfolio/presentation/pages/projects/mobile/project_view_mobile.dart';
import 'package:potfolio/portfolio/presentation/pages/projects/tab/project_view_tab.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_print.dart';

class ProjectsViewPage extends StatelessWidget {
  const ProjectsViewPage({super.key, required this.projectsModal});
  final ProjectData projectsModal;
  @override
  Widget build(BuildContext context) {
    double widthValue = MediaQuery.of(context).size.width;
    customPrint("width=${MediaQuery.of(context).size.width}");
    double textSize = 12;
    double copySize = 12;
    if (widthValue == 600 || widthValue <= 600) {
      textSize = 23;
      copySize = 27;
    } else if (widthValue == 1200 || widthValue <= 1200) {
      textSize = 15;
      copySize = 20;
    } else {
      textSize = 12;
      copySize = 12;
    }
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              // Mobile view
              return ListView(
                children: [
                  ProjectViewMobile(projectsModal: projectsModal),
                ],
              );
            } else if (constraints.maxWidth < 1200) {
              // Tablet view
              return ListView(
                padding: EdgeInsets.all(50.w),
                children: [
                  ProjectViewTab(projectsModal: projectsModal),
                ],
              );
            } else {
              // Desktop view
              return ListView(
                padding: EdgeInsets.all(50.w),
                children: [
                  ProjectViewDesktop(projectsModal: projectsModal),
                ],
              );
            }
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: [
              Text(
                "©",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: copySize.w,
                  color: AppColors.white.withOpacity(0.2),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "jishnu kp 2025",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: textSize.w,
                  color: AppColors.white.withOpacity(0.2),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
