import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potfolio/portfolio/presentation/pages/collaborator/common/collaborator_form.dart';
import 'package:potfolio/portfolio/presentation/pages/contacts/common/contactview.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_print.dart';

class TabCollaborator extends StatelessWidget {
  const TabCollaborator({super.key});

  @override
  Widget build(BuildContext context) {
    double widthValue = MediaQuery.of(context).size.width;
    alertPrint("width in tab ==$widthValue");
    double paddingOfGrid = 50;
    if (widthValue == 700 || widthValue <= 700) {
      paddingOfGrid = 5;
    } else if (widthValue == 900 || widthValue <= 900) {
      paddingOfGrid = 20;
    } else if (widthValue == 1100 || widthValue <= 1100) {
      paddingOfGrid = 30;
    } else if (widthValue == 1200 || widthValue <= 1200) {
      paddingOfGrid = 50;
    }
    return Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 150.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        // color: AppColors.blue,
                        height: 500.h,
                        width: 450.w,
                        child: ContactView(
                            profileHeight: 100.h,
                            profileWidth: 90.w,
                            nameFontSize: 20.sp,
                            roleFontSize: 17.sp,
                            itemDistances: 2.h,
                            locationFontSize: 16.sp,
                            locationIconSize: 17.sp,
                            nameAndGridDistance: 40.h,
                            gridhorizontalPadding: paddingOfGrid.w,
                            socialMediaGridWidth: 700.w)),
                    SizedBox(
                      width: 50.w,
                    ),
                    Expanded(child: CollaboratorFormPage()),
                  ],
                ),
              ),
            ]));
  }
}
