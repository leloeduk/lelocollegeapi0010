import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiBepec {
  static const String _baseUrl =
      'https://lelocollegeapi.onrender.com/api/api/bepec/';

  Future<List<dynamic>> fetchClasses() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load classes');
    }
  }
}
