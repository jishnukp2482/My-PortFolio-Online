import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potfolio/portfolio/presentation/pages/projects/common/project_grid_desktop.dart';

class ProjectsMobile extends StatelessWidget {
  const ProjectsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(50.w),
            child: ProjectsGridMenu(
              imgContainerHeight: 150.h,
              childAspectRatio: 0.78,
              crossAxisCount: 2,
              projectNameSize: 47.sp,
              subttileOverViewSize: 35.sp,
              isMobile: true,
            ),
          ),
        ],
      ),
    );
  }
}
