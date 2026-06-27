import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potfolio/portfolio/presentation/pages/projects/common/project_grid_desktop.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_print.dart';

class ProjectsTab extends StatelessWidget {
  const ProjectsTab({super.key});

  @override
  Widget build(BuildContext context) {
    double widthValue = MediaQuery.of(context).size.width;
    customPrint("width=${MediaQuery.of(context).size.width}");
    double childAspectRatio = 1;
    if (widthValue <= 700) {
      childAspectRatio = 0.7;
    } else if (widthValue <= 875) {
      childAspectRatio = 0.8;
    }
    // else if (widthValue <= 1000) {
    //   childAspectRatio = 0.8;
    // }
    else if (widthValue <= 1097) {
      childAspectRatio = 0.9;
    } else if (widthValue <= 1200) {
      childAspectRatio = 1.0;
    }
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProjectsGridMenu(
            imgContainerHeight: 110.h,
            projectNameSize: 25.sp,
            subttileOverViewSize: 20.sp,
            maxLines: 5,
            distance: 25.h,
            childAspectRatio: childAspectRatio,
            titileDistance: 30.h,
          ),
        ],
      ),
    );
  }
}
