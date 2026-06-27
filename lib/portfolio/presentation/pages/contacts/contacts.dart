import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potfolio/portfolio/presentation/pages/contacts/desktop/contact_desktop.dart';
import 'package:potfolio/portfolio/presentation/pages/contacts/mobile/contacts_mobile.dart';
import 'package:potfolio/portfolio/presentation/pages/contacts/tab/contacts_tab.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Mobile view
          return ListView(
            children: [
              Center(child: ContactstMobile(
                
              )),
            ],
          );
        } else if (constraints.maxWidth < 1200) {
          // Tablet view
          return ListView(
            padding: EdgeInsets.all(50.w),
            children: [
              ContactstTab(),
            ],
          );
        } else {
          // Desktop view
          return ListView(
            padding: EdgeInsets.all(50.w),
            children: [ContactsDesktop()],
          );
        }
      },
    );
  }
}
