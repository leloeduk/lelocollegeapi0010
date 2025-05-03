import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../features/class/models/school_class_model.dart';

class ApiService {
  // static const String baseUrl =
  //     'https://lelocollegeapi.onrender.com/api/api/classes/';

  Future<List<SchoolClassModel>> fetchClasses() async {
    final response = await http.get(
      Uri.parse('https://lelocollegeapi.onrender.com/api/api/classes/'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => SchoolClassModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load classes');
    }
  }
}
