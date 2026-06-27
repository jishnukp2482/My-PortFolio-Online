import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potfolio/portfolio/presentation/pages/collaborator/desktop/desktop_collaborator.dart';
import 'package:potfolio/portfolio/presentation/pages/collaborator/mobile/mobile_collaborator.dart';
import 'package:potfolio/portfolio/presentation/pages/collaborator/tab/tab_collaborator.dart';


class CollaboratorPage extends StatelessWidget {
  const CollaboratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Mobile view
          return ListView(
            children: [
              MobileCollaborator(),
            ],
          );
        } else if (constraints.maxWidth < 1200) {
          print("tab");
          // Tablet view
          return ListView(
            padding: EdgeInsets.all(50.w),
            children: [TabCollaborator()],
          );
        } else {
          // Desktop view
          return ListView(
            padding: EdgeInsets.all(50.w),
            children: [DesktopCollaborator()],
          );
        }
      },
    );
  }
}
