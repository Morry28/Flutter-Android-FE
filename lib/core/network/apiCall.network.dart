import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://api-26rxwsybga-uc.a.run.app';

  Future<Map<String, dynamic>> postData(
      String endpoint, Map<String, dynamic> payload) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        "Accept": "application/json",
      },
      body: jsonEncode(payload),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> res = jsonDecode(response.body);
      return res;
    } else {
      throw Exception('Failed to post data: ${response.body}');
    }
  }

  Future<bool> status() async {
    final url = Uri.parse('$baseUrl/api/turingmodels');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["status"] == "live";
      }
      return false;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
