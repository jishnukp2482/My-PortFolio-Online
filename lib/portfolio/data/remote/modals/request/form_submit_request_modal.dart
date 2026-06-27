class FormSubmitRequestModal {
  final String name;
  final String email;
  final String phone;
  final String whatsapp;
  final String captcha;
  final String description;

  FormSubmitRequestModal({
    required this.name,
    required this.email,
    required this.phone,
    required this.whatsapp,
    this.captcha = "false",
    required this.description,
  });

  Map<String, String> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "whatsapp": whatsapp,
      "description":description,
      "_captcha": captcha,
      '_subject': 'New Collaboration Request!',
    };
  }
}
