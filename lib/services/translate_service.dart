import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TranslateService {
  // غيّر الـ IP لـ IP جهازك
  
  static const String _baseUrl = 'http://10.37.185.43:8000';

  static Future<Map<String, dynamic>> translateSign(File imageFile) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$_baseUrl/translate'),
      );

      request.files.add(
        await http.MultipartFile.fromPath('file', imageFile.path),
      );

      final response = await request.send();
      final body     = await response.stream.bytesToString();
      final json     = jsonDecode(body);

      return json;
    } catch (e) {
      return {'error': e.toString()};
    }
  }
}