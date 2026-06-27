import 'package:dio/dio.dart';

class CreateContactRequestModel {
  final String title;
  final String url;
  final String order;
  final String? id;
  final MultipartFile? img;

  CreateContactRequestModel({
    required this.title,
    required this.url,
    required this.order,
    this.id,
    this.img,
  });
}
