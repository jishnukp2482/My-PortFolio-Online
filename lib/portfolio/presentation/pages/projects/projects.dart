import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potfolio/portfolio/presentation/pages/projects/desktop/project_desktop.dart';
import 'package:potfolio/portfolio/presentation/pages/projects/mobile/project_mobile.dart';
import 'package:potfolio/portfolio/presentation/pages/projects/tab/project_tab.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Mobile view
          return ListView(
            children: [
              ProjectsMobile(),
            ],
          );
        } else if (constraints.maxWidth < 1200) {
          // Tablet view
          return ListView(
            padding: EdgeInsets.all(50.w),
            children: [
              ProjectsTab(),
            ],
          );
        } else {
          // Desktop view
          return ListView(
            padding: EdgeInsets.all(50.w),
            children: [
              ProjectsDesktop(),
            ],
          );
        }
      },
    );
  }
}
