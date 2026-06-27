import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potfolio/portfolio/presentation/pages/contacts/common/contactview.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_print.dart';

class ContactstTab extends StatelessWidget {
  const ContactstTab({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double contactViewWidth = 350.0;
    customPrint("width=$width");
    if (width <= 690) {
      contactViewWidth = 400;
    } else if (width <= 830) {
      contactViewWidth = 350;
    }
    successPrint("width of container =$contactViewWidth");
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ContactView(
            socialMediaGridWidth: contactViewWidth.w,
          ),
        ],
      ),
    );
  }
}
