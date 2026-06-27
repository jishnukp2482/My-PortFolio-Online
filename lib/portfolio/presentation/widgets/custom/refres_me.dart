import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:potfolio/portfolio/presentation/routes/app_pages.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';

class RefreshMe extends StatelessWidget {
  const RefreshMe({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Something went wrong...',
            style: TextStyle(color: AppColors.appBlue),
          ),
          SizedBox(
            height: 30.h,
          ),
          ElevatedButton.icon(
            onPressed: () {
              GoRouter.of(context).go(AppPages.mainScreen);
            },
            label: Text("Refresh"),
            icon: Icon(Icons.refresh_outlined),
            iconAlignment: IconAlignment.end,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.backgroundcolor,
              iconColor: AppColors.appBlue,
              side: BorderSide(color: Theme.of(context).primaryColor),
            ),
          )
        ],
      ))),
    );
  }
}
