import 'package:flutter/material.dart';

class DashboardGridModel {
  final String title;
  final int id;
  final IconData icon;
  final void Function(BuildContext context) ontap;

  DashboardGridModel({
    required this.title,
    required this.id,
    required this.icon,
    required this.ontap,
  });
}
