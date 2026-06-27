import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bottomMsg(
  BuildContext context,
  String content, {
  bool field = true,
  String actionLabel = 'OK',
  VoidCallback? onActionPressed,
}) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth < 600) {
    // Mobile layout
    msg(
      context,
      content,
      actionLabel: actionLabel,
      field: field,
      onActionPressed: onActionPressed,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  } else if (screenWidth < 1200) {
    // Tablet layout
    msg(context, content,
        actionLabel: actionLabel,
        field: field,
        margin: EdgeInsets.only(left: (screenWidth - 600.w)),
        onActionPressed: onActionPressed);
  } else {
    // Desktop layout
    print("desktop");
    msg(context, content,
        actionLabel: actionLabel,
        field: field,
        margin: EdgeInsets.only(left: (screenWidth - 600.w)),
        onActionPressed: onActionPressed);
  }
}

msg(
  BuildContext context,
  String content, {
  bool field = true,
  String actionLabel = 'OK',
  VoidCallback? onActionPressed,
  EdgeInsetsGeometry? margin,
}) {
  if (ScaffoldMessenger.of(context).mounted) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        action: SnackBarAction(
          label: actionLabel,
          onPressed: () {
            if (onActionPressed != null) {
              onActionPressed();
            } else {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }
          },
        ),
        behavior: SnackBarBehavior.floating,
        margin:
            margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
