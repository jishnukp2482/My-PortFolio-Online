import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potfolio/portfolio/presentation/pages/about/desktop/about_desktop.dart';
import 'package:potfolio/portfolio/presentation/pages/about/mobile/about_mobile.dart';
import 'package:potfolio/portfolio/presentation/pages/about/tab/about_tab.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Mobile view
          return ListView(
            children: [
              AboutMobile(),
            ],
          );
        } else if (constraints.maxWidth < 1200) {
          // Tablet view
          return ListView(
            padding: EdgeInsets.all(50.w),
            children: [
              AboutTab(),
            ],
          );
        } else {
          // Desktop view
          return ListView(
            padding: EdgeInsets.all(50.w),
            children: [AboutDesktop()],
          );
        }
      },
    );
  }
}
