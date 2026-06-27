import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';

class AppLoader {
  static bool _isShowing = false;

  /// SHOW LOADER
  static void show(BuildContext context, {String message = "Please wait..."}) {
    if (_isShowing) return;

    _isShowing = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            backgroundColor: AppColors.lightBlack,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.w),
            ),
            content: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: AppColors.appBlue),

                SizedBox(width: 20.w),

                Expanded(
                  child: Text(
                    message,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// HIDE LOADER
  static void hide(BuildContext context) {
    if (_isShowing && Navigator.canPop(context)) {
      Navigator.of(context, rootNavigator: true).pop();
      _isShowing = false;
    }
  }
}
