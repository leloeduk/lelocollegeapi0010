import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lelocollege/features/document/bloc/document_bloc.dart';

class ApiDocument {
  static const String _baseUrl =
      'https://lelocollegeapi.onrender.com/api/api/documents/';

  Future<List<dynamic>> fetchDocuments() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load classes');
    }
  }
}
