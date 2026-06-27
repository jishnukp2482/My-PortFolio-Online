import 'package:flutter/material.dart';

class HomeGridModal {
  final int id;
  final String title;
  final String subtitle;
  final IconData icon;
  final int rawSpan;
  final int columnPan;
  final Function ontap;

  HomeGridModal(
      {
        required this.id,
        required this.title,
      required this.subtitle,
      required this.icon,
      required this.rawSpan,
      required this.columnPan,
      required this.ontap});
}
