import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../../models/chapitre_model.dart';
import '../../../models/classe_model.dart';
import '../../../models/devoir_model.dart';
import '../../../models/matiere_model.dart';

class DatasRepository {
  static const String baseUrl = "https://lelocollegeapi.onrender.com/api/api/";
  static const String dataBoxName = 'dataBox';
  Box<String>? _dataBox;

  Future<void> initBox() async {
    if (_dataBox == null) {
      _dataBox = await Hive.openBox<String>(dataBoxName);
      print("Boîte Hive '$dataBoxName' initialisée.");
    }
  }

  Future<List<T>> fetchData<T>(
    String endpoint,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint/'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        final data = jsonData.map<T>((json) => fromJson(json)).toList();
        await saveData(endpoint, data);
        print("Données récupérées depuis l'API ($endpoint): ${data.length}");
        return data;
      } else {
        throw Exception(
          'Erreur lors du chargement des données ($endpoint): ${response.statusCode}',
        );
      }
    } catch (e) {
      print('Erreur dans fetchData (online) pour $endpoint: $e');
      return await loadData<T>(endpoint, fromJson);
    }
  }

  Future<List<ClasseModel>> fetchClasses() =>
      fetchData('classes', (json) => ClasseModel.fromJson(json));
  Future<List<MatiereModel>> fetchMatieres() =>
      fetchData('matieres', (json) => MatiereModel.fromJson(json));
  Future<List<ChapitreModel>> fetchChapitres() =>
      fetchData('chapitres', (json) => ChapitreModel.fromJson(json));
  Future<List<DevoirModel>> fetchDevoirs() =>
      fetchData('devoirs', (json) => DevoirModel.fromJson(json));

  Future<void> saveData<T>(String key, List<T> data) async {
    await initBox();
    try {
      final jsonData = jsonEncode(data);
      await _dataBox!.put(key, jsonData);
      print("Données sauvegardées sous la clé '$key'.");
    } catch (e) {
      print("Erreur lors de la sauvegarde de la clé '$key': $e");
    }
  }

  Future<List<T>> loadData<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    await initBox();
    final jsonData = _dataBox!.get(key);
    if (jsonData != null) {
      try {
        final List<dynamic> dataList = jsonDecode(jsonData);
        final List<T> list = dataList.map((item) => fromJson(item)).toList();
        print("Données chargées pour la clé '$key': ${list.length} éléments");
        return list;
      } catch (e) {
        print("Erreur lors du décodage des données de la clé '$key': $e");
        rethrow;
      }
    }
    print("Aucune donnée trouvée pour la clé '$key'.");
    return [];
  }

  Future<Map<String, List<dynamic>>> fetchAllDatas() async {
    try {
      print('Fetching all data...');
      final classes = await fetchClasses();
      final matieres = await fetchMatieres();
      final chapitres = await fetchChapitres();
      final devoirs = await fetchDevoirs();

      final Map<int, MatiereModel> matiereMap = {
        for (var m in matieres) m.id: m,
      };
      for (var chapitre in chapitres) {
        final matiere = matiereMap[chapitre.matiereId];
        if (matiere != null) {
          matiere.chapitres.add(chapitre);
        }
      }

      print('All data fetched and mapped successfully.');
      return {
        'classes': classes,
        'matieres': matieres,
        'chapitres': chapitres,
        'devoirs': devoirs,
      };
    } catch (e) {
      print('Error fetching all data: $e');
      return {
        'classes': await loadData<ClasseModel>(
          'classes',
          (json) => ClasseModel.fromJson(json),
        ),
        'matieres': await loadData<MatiereModel>(
          'matieres',
          (json) => MatiereModel.fromJson(json),
        ),
        'chapitres': await loadData<ChapitreModel>(
          'chapitres',
          (json) => ChapitreModel.fromJson(json),
        ),
        'devoirs': await loadData<DevoirModel>(
          'devoirs',
          (json) => DevoirModel.fromJson(json),
        ),
      };
    }
  }
}
