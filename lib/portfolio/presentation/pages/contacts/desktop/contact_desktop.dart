import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potfolio/portfolio/presentation/pages/contacts/common/contactview.dart';

class ContactsDesktop extends StatelessWidget {
  const ContactsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ContactView(),
        ],
      ),
    );
  }
}
