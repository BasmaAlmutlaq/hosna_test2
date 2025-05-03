class MockFirebaseStorage {
  Future<String> uploadAndGetUrl(dynamic image) async {
    return 'https://mock.url/image.jpg';
  }
}
