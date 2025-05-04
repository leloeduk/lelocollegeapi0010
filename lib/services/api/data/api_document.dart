import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../features/document/domain/models/document_model.dart';

class ApiDocument {
  static const String _baseUrl =
      'https://lelocollegeapi.onrender.com/api/api/documents/';

  Future<List<dynamic>> fetchDocuments() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => DocumentModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load classes');
    }
  }
}
