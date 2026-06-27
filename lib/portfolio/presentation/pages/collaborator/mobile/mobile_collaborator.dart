import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potfolio/portfolio/presentation/pages/collaborator/common/collaborator_form.dart';

class MobileCollaborator extends StatelessWidget {
  const MobileCollaborator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(100.w),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CollaboratorFormPage(
                titleFontSize: 55.sp,
              ),
            ]));
  }
}
