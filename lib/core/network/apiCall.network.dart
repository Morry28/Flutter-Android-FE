import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://192.168.100.16:3000';

  Future<Map<String, dynamic>> postData(
      String endpoint, Map<String, dynamic> payload) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(payload),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> res = jsonDecode(response.body);
      return res;
    } else {
      throw Exception('Failed to post data: ${response.body}');
    }
  }
}
