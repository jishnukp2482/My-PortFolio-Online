import 'package:dio/dio.dart';

class EmailService {
  static Future<void> sendEmail({
    required String name,
    required String email,
    required String phone,
    required String whatsapp,
    required String description,
  }) async {
    const serviceId = 'service_0xg80fh';
    const templateId = 'template_ftwfae3';
    const publicKey = 'fyW_8JMknCHp3nRSL';

    final dio = Dio();

    final response = await dio.post(
      'https://api.emailjs.com/api/v1.0/email/send',
      data: {
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': publicKey,
        'template_params': {
          'name': name,
          'email': email,
          'phone': phone,
          'whatsapp': whatsapp,
          'description': description,
        }
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode != 200) {
      throw Exception("Email failed: ${response.data}");
    }
  }
}
