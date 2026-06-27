import 'package:flutter/material.dart';

class AppBarTitleModal {
  final IconData icon;
  final String title;
  final Function ontap;
  final int id;
  AppBarTitleModal(
      {required this.icon,
      required this.title,
      required this.ontap,
      required this.id});
}
