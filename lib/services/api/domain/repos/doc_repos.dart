abstract class DocRepo {
  Future<List<dynamic>> fetchClasses();
  Future<List<dynamic>> fetchMatieres();
  Future<List<dynamic>> fetchChapters();
  Future<List<dynamic>> fetchDevoirs();
  Future<List<dynamic>> fetchDocuments();
  Future<List<dynamic>> fetchBepecs();
}
