// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:lelocollege/models/classe_model.dart';
// import '../domain/repos/doc_repos.dart';

// class DataRepository implements DocRepo {
//   static const String baseUrl = "https://lelocollegeapi.onrender.com/api";

//   @override
//   Future<List<dynamic>> fetchClasses() async {
//     final response = await http.get(Uri.parse('$baseUrl/classes/'));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       print('Fetched classes: $data'); // Ajout d'une impression de débogage
//       return data;
//     } else {
//       throw Exception('Failed to load classes');
//     }
//   }

//   @override
//   Future<List<dynamic>> fetchMatieres() async {
//     final response = await http.get(Uri.parse('$baseUrl/matieres/'));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       print('Fetched matieres: $data'); // Ajout d'une impression de débogage
//       return data;
//     } else {
//       throw Exception('Failed to load matieres');
//     }
//   }

//   @override
//   Future<List<dynamic>> fetchChapters() async {
//     final response = await http.get(Uri.parse('$baseUrl/chapitres/'));
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body) as List;
//     } else {
//       throw Exception('Erreur lors du chargement des chapitres');
//     }
//   }

//   @override
//   Future<List<dynamic>> fetchDevoirs() async {
//     final response = await http.get(Uri.parse('$baseUrl/devoirs/'));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       print('Fetched devoirs: $data'); // Ajout d'une impression de débogage
//       return data;
//     } else {
//       throw Exception('Failed to load devoirs');
//     }
//   }

//   @override
//   Future<List<dynamic>> fetchDocuments() async {
//     final response = await http.get(Uri.parse('$baseUrl/documents/'));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       print('Fetched documents: $data'); // Ajout d'une impression de débogage
//       return data;
//     } else {
//       throw Exception('Failed to load documents');
//     }
//   }

//   @override
//   Future<List<dynamic>> fetchBepecs() async {
//     final response = await http.get(Uri.parse('$baseUrl/bepecs/'));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       print('Fetched bepecs: $data'); // Ajout d'une impression de débogage
//       return data;
//     } else {
//       throw Exception('Failed to load bepecs');
//     }
//   }
// }
