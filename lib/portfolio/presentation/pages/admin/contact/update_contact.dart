import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/contact/contact_controller.dart';
import 'package:potfolio/portfolio/presentation/pages/about/common/socialmedia_grid.dart';
import 'package:potfolio/portfolio/presentation/pages/admin/contact/helpers/update_contact_helper.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_bottom_msg.dart';

class UpdateContact extends ConsumerStatefulWidget {
  const UpdateContact({super.key});

  @override
  ConsumerState<UpdateContact> createState() => _UpdateContactState();
}

class _UpdateContactState extends ConsumerState<UpdateContact> {
  late ContactController contactController;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      contactController = ref.read(contactControllerProvider.notifier);
      contactController.fetchAllContacts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final contactState = ref.watch(contactControllerProvider);
    final contactController = ref.read(contactControllerProvider.notifier);
    ref.listen(contactControllerProvider, (previous, next) {
      if (previous?.isLoading == true &&
          next.isLoading == false &&
          next.contactError != null) {
        bottomMsg(context, next.contactError ?? "");
      }
    });

    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(20.w),
          children: [
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contacts",
                  style: GoogleFonts.inter(
                    color: AppColors.appBlue,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2.w,
                    fontSize: 26.sp,
                  ),
                ),
                SizedBox(width: 10.w),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    contactAlert(
                      context: context,
                      onConfirm: (model) {
                        contactController.createContact(model);
                      },
                    );
                  },
                  icon: Icon(Icons.add, color: AppColors.appBlue),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            SocialMediaGridMenu(
              isFromAdmin: true,
              crossAxisCount: 3,
              crossAxisSpacing: 20.w,
              mainAxisSpcaing: 20.h,
              childAspectRatio: 12 / 3,
              isListview: false,
              onDelete: (p0) {
                deleteItemContact(
                  context: context,
                  title: "Contact",
                  deletingItemTtitle: "${p0.title},${p0.url}",
                  onConfirm: () {
                    contactController.deleteContact(p0.id);
                  },
                );
              },
              onAdminPress: (p0) {
                contactAlert(
                  model: p0,
                  context: context,
                  onConfirm: (model) {
                    contactController.updateContact(model);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
