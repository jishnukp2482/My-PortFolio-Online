import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potfolio/portfolio/presentation/pages/contacts/common/contactview.dart';

class ContactstMobile extends StatelessWidget {
  const ContactstMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          ContactView(
            contactIocnSize: 130.sp,
            profileHeight: 100.h,
            locationFontSize: 40.sp,
            locationIconSize: 45.sp,
            nameFontSize: 43.sp,
            roleFontSize: 41.sp,
            itemDistances: 10.sp,
            nameAndGridDistance: 40.h,
            locationwidth: MediaQuery.of(context).size.width / 2,
            socialMediaGridWidth: MediaQuery.of(context).size.width / 2.5,
          ),
        ],
      ),
    );
  }
}
