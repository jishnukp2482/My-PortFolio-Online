import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potfolio/portfolio/presentation/pages/collaborator/common/collaborator_form.dart';
import 'package:potfolio/portfolio/presentation/pages/contacts/common/contactview.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_print.dart';

class DesktopCollaborator extends StatelessWidget {
  const DesktopCollaborator({super.key});

  @override
  Widget build(BuildContext context) {
    double widthValue = MediaQuery.of(context).size.width;
    alertPrint("width in desktop ==$widthValue");
    double contactHeight = 475;
    if (widthValue == 1200 || widthValue <= 1200) {
      contactHeight = 480;
    } else if (widthValue == 1202 || widthValue <= 1250) {
      contactHeight = 480;
    } else if (widthValue == 1350 || widthValue <= 1400) {
      contactHeight = 510;
    } else if (widthValue == 1400 || widthValue <= 1450) {
      contactHeight = 520;
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
                        height: contactHeight.h,
                        width: 450.w,
                        child: ContactView(
                            profileHeight: 80.h,
                            profileWidth: 80.w,
                            nameFontSize: 18.sp,
                            roleFontSize: 15.sp,
                            itemDistances: 1.h,
                            locationFontSize: 13.sp,
                            locationIconSize: 16.sp,
                            nameAndGridDistance: 40.h,
                            gridhorizontalPadding: 60.w,
                            socialMediaGridWidth: 350.w)),
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
