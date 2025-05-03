import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../features/homework/models/homework_model.dart';

class ApiHomework {
  final String baseUrl = "https://lelocollegeapi.onrender.com/api/api/devoirs/";

  Future<List<HomeworkModel>> fetchHomeworks() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => HomeworkModel.fromJson(json)).toList();
    } else {
      throw Exception('Erreur lors du chargement des devoirs');
    }
  }
}
