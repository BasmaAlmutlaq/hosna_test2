class ProjectUpdateService {
  final MockFirebaseStorage storage;
  final MockFirestore firestore;

  ProjectUpdateService({required this.storage, required this.firestore});

  Future<void> postUpdate({
    required String projectId,
    required String text,
    dynamic image,
  }) async {
    String? imageUrl;

    if (image != null) {
      imageUrl = await storage.uploadAndGetUrl(image);
    }

    await firestore.addUpdate({
      'projectId': projectId,
      'text': text,
      'imageUrl': imageUrl ?? '',
    });
  }
}

class Updates {
  Future<List<Map<String, dynamic>>> getProjectUpdates(String projectId) async {
    if (projectId == 'project_with_updates') {
      return [
        {'text': 'Update 1', 'timestamp': DateTime.now()},
      ];
    }
    // - Project WITHOUT updates
    else {
      return [];
    }
  }
}

class MockFirebaseStorage {
  Future<String> uploadAndGetUrl(dynamic image) async {
    return 'https://mock.url/image.jpg';
  }
}

class MockFirestore {
  Future<void> addUpdate(Map<String, dynamic> data) async {
    print('Mock added to Firestore: $data');
  }
}
