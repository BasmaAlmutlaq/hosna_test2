class MockFirestore {
  Future<void> addUpdate(Map<String, dynamic> data) async {
    print('Mock added to Firestore: $data');
  }
}
